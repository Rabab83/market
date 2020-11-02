import 'package:flutter/material.dart';
import 'package:marketApp/model/classes.dart';
import 'package:marketApp/screen/brandF/BrandFile.dart';
import 'package:marketApp/screen/brandF/addNewBrand.dart';
import 'package:marketApp/services/crudFunctions.dart';

// Widget To view All Brands Names
//also, navigation to form(AddNewBrandPage) that add new brand name via floating action button
//and navigation to BrandFile(Description & Operation) through tapping the brand name
class ViewBrands extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brands'),
      ),
      body: FutureBuilder(
        future: NewBrandDB().getBrandsNames(),
        builder:
            (BuildContext context, AsyncSnapshot<List<NewBrand>> snapshot) {
          if (snapshot.hasError)
            return Center(child: CircularProgressIndicator());
          return ListView.builder(
            itemCount: snapshot.data != null ? snapshot.data.length : 0,
            itemBuilder: (BuildContext context, int index) {
              NewBrand newBrand = snapshot.data[index];
              return Card(
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(newBrand.name),  //Brand Name
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            color: Colors.deepPurple,
                            icon: Icon(Icons.edit),
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    AddNewBrandPage(newBrand: newBrand),
                              ),
                            ),
                          ),
                          IconButton(
                            color: Colors.red,
                            icon: Icon(Icons.delete),
                            onPressed: () => _deleteBrand(context, newBrand.id),
                          ),
                        ],
                      ),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              BrandFile(aBid: newBrand.id,
                               name: newBrand.name),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddNewBrandPage()));
        },
      ),
    );
  }

  void _deleteBrand(BuildContext context, String id) async {
    if (await _showConfirmationDialog(context)) {
      try {
        await NewBrandDB().deleteBrandName(id);
      } catch (e) {
        print(e);
      }
    }
  }

  Future<bool> _showConfirmationDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        content: Text("Are you sure you want to delete?"),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.red,
            child: Text("Delete"),
            onPressed: () => Navigator.pop(context, true),
          ),
          FlatButton(
            textColor: Colors.black,
            child: Text("No"),
            onPressed: () => Navigator.pop(context, false),
          ),
        ],
      ),
    );
  }
}
