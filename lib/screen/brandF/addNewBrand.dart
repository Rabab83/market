import 'package:flutter/material.dart';
import 'package:marketApp/model/classes.dart';
import 'package:marketApp/services/crudFunctions.dart';

// Form to add New Brand Name and Email
//Navigation From ViewBrands
class AddNewBrandPage extends StatefulWidget {
  final AccountBreif accountBreif;
  final NewBrand newBrand;
  const AddNewBrandPage({Key key, this.newBrand, this.accountBreif})
      : super(key: key);
  @override
  _AddANewBrandPageState createState() => _AddANewBrandPageState();
}

TextEditingController _nameController;
TextEditingController _emailController;

class _AddANewBrandPageState extends State<AddNewBrandPage> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  FocusNode _emailNode;

  @override
  void initState() {
    super.initState();
    _nameController =
        TextEditingController(text: isEditMode ? widget.newBrand.name : '');
    _emailController =
        TextEditingController(text: isEditMode ? widget.newBrand.email : '');
    _emailNode = FocusNode();
  }

  get isEditMode => widget.newBrand != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditMode ? 'Edit Brand' : 'Add New Brand'),
        // title: Text( 'Add New Brand'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Entering the Name
              TextFormField(
                textInputAction: TextInputAction.next,
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_emailNode);
                },
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Name cannot be empty";
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "name",
                  border: OutlineInputBorder(),
                ),
              ),
              // Entering Email
              const SizedBox(height: 10.0),
              TextFormField(
                focusNode: _emailNode,
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Email cannot be empty";
                  return null;
                },
                maxLines: 2,
                decoration: InputDecoration(
                  labelText: "email",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20.0),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: Text(isEditMode ? "Update" : "Save"),
                //Adding Data to firebase
                onPressed: () async {
                  if (_key.currentState.validate()) {
                    try {
                      if (isEditMode) {
                        NewBrand newBrand = NewBrand(
                          email: _emailController.text.trim(),
                          name: _nameController.text.trim(),
                          id: widget.newBrand.id,
                        );
                        await NewBrandDB().updateBrandName(newBrand);
                        Navigator.pop(context);
                        Navigator.pop(context);
                      } else {
                        _addNewBrand();
                        Navigator.pop(context);
                      }
                    } catch (e) {
                      print(e);
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

void _addNewBrand() async {
  NewBrand newBrand = NewBrand(
    email: _emailController.text.trim(),
    name: _nameController.text.trim(),
  );
  await NewBrandDB().addBrandName(newBrand);

  AccountBreif accountBreif = AccountBreif(
    aBid: newBrand.email,
  );
  await NewAccountBreifDB().initializaAccountBreif(accountBreif);
}
