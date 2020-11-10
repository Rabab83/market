import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:marketApp/model/classes.dart';
import 'package:marketApp/screen/brandFiles/brandOpretion/viewEmployeeList.dart';
import 'package:marketApp/services/auth.dart';
import 'package:marketApp/services/crudFunctions.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;

final employeesRef = FirebaseFirestore.instance
    .collection('users')
    .where('isEmployee ', isEqualTo: true);

class AddTaskPage extends StatefulWidget {
  final TaskModel taskModel;
  final String aBid;

  const AddTaskPage({
    Key key,
    this.taskModel,
    this.aBid,
  }) : super(key: key);

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

TextEditingController _nameController;
TextEditingController _descriptionController;
DateTime _taskDate;

class _AddTaskPageState extends State<AddTaskPage> {
  // GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  bool processing;
  List<String> employeesNames = <String>[
    '',
    'Ahmed',
    'Mohammed',
    'Mahmoud',
    'Ali',
    'Mamdouh',
  ];
  String employeeName = '';
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
    processing = false;
    // getEmployees();
  }

  // getEmployees() {
  //   setState(() {
  //     employeesRef.get().then((QuerySnapshot querySnapshot) => {
  //           querySnapshot.docs.forEach((doc) {
  //             print(doc["userName"]);
  //             employeesNames.add(doc["userName"]);
  //           })
  //         });
  //   });
  // }

  get isEditMode => widget.taskModel != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditMode ? 'Edit Task' : 'Add New Task'),
      ),
      key: _key,
      body: new SafeArea(
        top: false,
        bottom: false,
        child: new Form(
          key: _formKey,
          child: Container(
            alignment: Alignment.center,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
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
                new FormField(
                  builder: (FormFieldState state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        icon: const Icon(Icons.person),
                        labelText: 'Employees',
                      ),
                      isEmpty: employeeName == '',
                      child: new DropdownButtonHideUnderline(
                        child: new DropdownButton(
                          value: employeeName,
                          isDense: true,
                          onChanged: (String newValue) {
                            setState(() {
                              employeeName = newValue;
                              state.didChange(newValue);
                            });
                          },
                          items: employeesNames.map((String value) {
                            return new DropdownMenuItem(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20.0),
                processing
                    ? Center(child: CircularProgressIndicator())
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(30.0),
                          color: Theme.of(context).primaryColor,
                          child: MaterialButton(
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  processing = true;
                                });
                                if (widget.taskModel != null) {
                                  TaskModel taskModel = TaskModel(
                                    name: _nameController.text.trim(),
                                    description:
                                        _descriptionController.text.trim(),
                                    id: widget.taskModel.id,
                                    taskdate: widget.taskModel.taskdate,
                                    assignedemployeeId: employeeName,
                                  );
                                  await NewTaskDB().updateTask(taskModel);
                                } else {
                                  final userId =
                                      FirebaseAuth.instance.currentUser.email;
                                  final empN = await FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(userId)
                                      .get();
                                  final empName = empN.data()['userName'];
                                  print(empName);
                                  await NewTaskDB().addNewTask(
                                    TaskModel(
                                      name: _nameController.text.trim(),
                                      description:
                                          _descriptionController.text.trim(),
                                      taskdate: _taskDate,
                                      aBid: widget.aBid,
                                      assignedemployeeId: employeeName,
                                      employeeId: empName,
                                    ),
                                  );
                                  Navigator.pop(context);
                                }
                                Navigator.pop(context);
                                setState(() {
                                  processing = false;
                                });
                              }
                            },
                            child: Text(isEditMode ? "Update" : "Save"),
                          ),
                        ),
                      ),
              ],
            ),
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
