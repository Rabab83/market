import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:marketApp/model/classes.dart';
import 'package:marketApp/services/auth.dart';
import 'package:marketApp/services/crudFunctions.dart';

// final employeesRef = FirebaseFirestore.instance
//     .collection('users')
//     .where('isEmployee ', isEqualTo: true).get();
final usersRef = FirebaseFirestore.instance.collection('users');

class AddTaskPage extends StatefulWidget {
  final TaskModel taskModel;
  final String aBid;
  //final DateTime selectedDate;
  const AddTaskPage({
    Key key,
    this.taskModel,
    this.aBid,
    // this.selectedDate
  }) : super(key: key);

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

TextEditingController _nameController;
TextEditingController _descriptionController;
DateTime _taskDate;
DateTime _endDate;

class _AddTaskPageState extends State<AddTaskPage> {
  // GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  bool processing;
  List<dynamic> employeesNames = [];
  List<String> employees = [];

  var employeeName;
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
    _nameController =
        TextEditingController(text: isEditMode ? widget.taskModel.name : '');
    _descriptionController = TextEditingController(
        text: isEditMode ? widget.taskModel.description : '');
    _taskDate = DateTime.now();
    _endDate = DateTime.now();
    processing = false;
    _getEmployees();
    super.initState();
  }

  _getEmployees() async {
    final docRef = await usersRef.get();
    setState(() {
      docRef.docs.forEach((doc) {
        if (doc.data()['isEmployee'] == true) {
          employeesNames.add(doc.data()['userName']);
          //print(employeesNames);
        }
      });
      employeesNames.forEach((element) {
        employees.add(element.toString());
      });
      print(employees);
    });
  }

  get isEditMode => widget.taskModel != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditMode ? 'Edit Task' : 'Add New Task'),
        leading: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () => Navigator.pop(context),
        ),
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
                // Add title of task
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: TextFormField(
                    //initialValue: widget.taskModel?.name,
                    controller: _nameController,
                    validator: (value) => (value.isEmpty)
                        ? "Add a title to this task or brand Name "
                        : null,
                    decoration: InputDecoration(
                      labelText: "title",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Divider(),
                // Add Description of the task
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: TextFormField(
                    //initialValue: widget.taskModel?.description,
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
                      //icon: Icon(Icons.short_text),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Divider(),
                // choosing a start date of the task
                ListTile(
                  trailing: Icon(Icons.calendar_today_sharp),
                  title: Text("Stert Date (YYYY-MM-DD)"),
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
                Divider(),
                // choosing a end date of the task
                ListTile(
                  trailing: Icon(Icons.calendar_today_sharp),
                  title: Text("End Date (YYYY-MM-DD)"),
                  subtitle: Text(
                      "${_endDate.year} - ${_endDate.month} - ${_endDate.day}"),
                  onTap: () async {
                    DateTime picked = await showDatePicker(
                        context: context,
                        initialDate: _endDate == null ? null : _endDate,
                        firstDate: DateTime(_endDate.year - 5),
                        lastDate: DateTime(_endDate.year + 5));
                    if (picked != null) {
                      //var startDate = _taskDate;
                      // if (_endDate == null) return null;
                      if (_taskDate.millisecondsSinceEpoch >
                          picked.millisecondsSinceEpoch) {
                        return "End Date can not be before Start Date";
                      } else {
                        setState(() {
                          _endDate = picked;
                        });
                      }
                    } else {
                      _endDate = null;
                    }
                  },
                ),
                // FormBuilderDateTimePicker(),
                SizedBox(height: 10.0),
                Divider(),
                // Choose the employee to send him a task
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: new FormField(
                    builder: (FormFieldState state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.person),
                          labelText: 'Employees',
                          filled: true,
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(1),
                        ),
                        isEmpty: employeeName == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton(
                            value: employeeName,
                            isDense: true,
                            onChanged: (var newValue) {
                              setState(() {
                                employeeName = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: employees.map((var value) {
                              return new DropdownMenuItem(
                                value: value,
                                child: new Text(value.toString()),
                              );
                            }).toList(),
                            //hint: Text('Choose an Employee to have this task'),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.0),
                Divider(),
                // Save or update Button
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
                                final userId =
                                    FirebaseAuth.instance.currentUser.email;
                                final empN = await FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(userId)
                                    .get();
                                final empName = empN.data()['userName'];
                                setState(() {
                                  processing = true;
                                });
                                // Update exist Task
                                if (widget.taskModel != null) {
                                  TaskModel taskModel = TaskModel(
                                    name: _nameController.text.trim(),
                                    description:
                                        _descriptionController.text.trim(),
                                    id: widget.taskModel.id,
                                    taskdate: widget.taskModel.taskdate,
                                    endDate: widget.taskModel.endDate,
                                    assignedemployeeId: employeeName,
                                    assignedemployeeMail: userId,
                                    employeeId: empName,
                                  );
                                  await NewTaskDB().updateTask(taskModel);
                                } else {
                                  // Add New Task
                                  await NewTaskDB().addNewTask(
                                    TaskModel(
                                      name: _nameController.text.trim(),
                                      description:
                                          _descriptionController.text.trim(),
                                      taskdate: _taskDate,
                                      endDate: _endDate,
                                      aBid: widget.aBid,
                                      assignedemployeeId: employeeName,
                                      assignedemployeeMail: userId,
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
