import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:marketApp/model/classes.dart';
import 'package:marketApp/services/crudFunctions.dart';

class AddTaskPage extends StatefulWidget {
  final TaskModel taskModel;
  final String aBid;

  const AddTaskPage({Key key, this.taskModel, this.aBid}) : super(key: key);

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

TextEditingController _nameController;
TextEditingController _descriptionController;

class _AddTaskPageState extends State<AddTaskPage> {
  DateTime _taskDate;
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  // bool processing;

  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
    _nameController =
        TextEditingController(text: isEditMode ? widget.taskModel.name : '');
    _descriptionController = TextEditingController(
        text: isEditMode ? widget.taskModel.description : '');
    _taskDate = DateTime.now();
    // processing = false;
  }

  get isEditMode => widget.taskModel != null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditMode ? 'Edit Task' : 'Add New Task'),
      ),
      body: Form(
        key: _key,
        child: Container(
          alignment: Alignment.center,
          child: ListView(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextFormField(
                  controller: _nameController,
                  validator: (value) =>
                      (value.isEmpty) ? "Please Enter Brand Name" : null,
                  decoration: InputDecoration(
                    labelText: "Name",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextFormField(
                  controller: _descriptionController,
                  minLines: 3,
                  maxLines: 5,
                  validator: (value) =>
                      (value.isEmpty) ? "Please Enter description" : null,
                  decoration: InputDecoration(
                    labelText: "description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              ListTile(
                title: Text("Date (YYYY-MM-DD)"),
                subtitle: Text(
                    "${_taskDate.year} - ${_taskDate.month} - ${_taskDate.day}"),
                onTap: () async {
                  DateTime picked = await showDatePicker(
                      context: context,
                      initialDate: _taskDate,
                      firstDate: DateTime(_taskDate.year - 5),
                      lastDate: DateTime(_taskDate.year + 5));
                  if (picked != null) {
                    setState(() {
                      _taskDate = picked;
                    });
                  }
                },
              ),
              SizedBox(height: 10.0),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: Text(isEditMode ? "Update" : "Save"),
                //Adding Data to firebase
                onPressed: () async {
                  if (_key.currentState.validate()) {
                    try {
                      if (isEditMode) {
                        TaskModel taskModel = TaskModel(
                          description: _descriptionController.text.trim(),
                          name: _nameController.text.trim(),
                          aBid: widget.taskModel.aBid,
                        );
                        await NewTaskDB().updateTask(taskModel);
                      } else {
                        TaskModel taskModel = TaskModel(
                          description: _descriptionController.text.trim(),
                          name: _nameController.text.trim(),
                          aBid: widget.taskModel.aBid,
                        );
                        await NewTaskDB().addNewTask(taskModel);
                        Navigator.pop(context);
                      }
                    } catch (e) {
                      print(e);
                    }
                  }
                },
              )
              // processing
              //     ? Center(child: CircularProgressIndicator())
              //     : Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 16.0),
              //         child: Material(
              //           elevation: 5.0,
              //           borderRadius: BorderRadius.circular(30.0),
              //           color: Theme.of(context).primaryColor,
              //           child: MaterialButton(
              //             onPressed: () async {
              //               if (_formKey.currentState.validate()) {
              //                 setState(() {
              //                   processing = true;
              //                 });
              //                 if (widget.taskModel != null) {
              //                   await newTaskDB. (widget.taskModel.aBid, {
              //                     "name": _name.text.trim(),
              //                     "description": _description.text.trim(),
              //                     "task_date": widget.taskModel.taskDate,
              //                   });
              //                 } else {
              //                   await newTaskDB.createItem(
              //                     TaskModel (
              //                       name: _name.text.trim(),
              //                       description: _description.text.trim(),
              //                       taskDate: _taskDate,
              //                     ),
              //                   );
              //                 }
              //                 Navigator.pop(context);
              //                 setState(() {
              //                   processing = false;
              //                 });
              //               }
              //             },
              //             child: Text(
              //               "Save",
              //               style: style.copyWith(
              //                   color: Colors.white,
              //                   fontWeight: FontWeight.bold),
              //             ),
              //           ),
              //         ),
              //       ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
