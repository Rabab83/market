import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_helpers/firebase_helpers.dart';
import 'package:flutter/material.dart';
import 'package:marketApp/model/classes.dart';
import 'package:marketApp/screen/brandFiles/brandOpretion/tasks/addTask.dart';
import 'package:marketApp/screen/brandFiles/brandOpretion/tasks/viewTaskDetails.dart';
import 'package:marketApp/services/utls.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:marketApp/services/crudFunctions.dart';

//Widget that is used to view each Brand Tasks
//Navigation from "BrandFile" widget in brandF folder
class ViewBrandCalender extends StatefulWidget {
  final String aBid;
  final String name;
  ViewBrandCalender({this.name, this.aBid});

  @override
  _ViewBrandCalenderState createState() => _ViewBrandCalenderState();
}

class _ViewBrandCalenderState extends State<ViewBrandCalender> {
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _tasks;
  List<dynamic> _selectedTasks;
  List<TaskModel> allTasks;
  DateTime today;
  DateTime firstDate;
  DateTime lastDate;
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
    super.initState();
    _controller = CalendarController();
    _tasks = {};
    _selectedTasks = [];
  }

  // Function that returns the same date Tasks
  Map<DateTime, List<dynamic>> _groupTasks(List<TaskModel> tasks) {
    Map<DateTime, List<dynamic>> data = {};
    tasks.forEach((task) {
      DateTime date = DateTime(
          task.taskdate.year, task.taskdate.month, task.taskdate.day, 12);
      if (task.endDate != null) {
        DateTime endDate = DateTime(
            task.endDate.year, task.endDate.month, task.endDate.day, 12);
        for (var i = date;
            i.millisecondsSinceEpoch <= endDate.millisecondsSinceEpoch;
            i = i.add(Duration(days: 1))) {
          if (data[i] == null) data[i] = [];
          data[i].add(task);
        }
      } else {
        if (data[date] == null) data[date] = [];
        data[date].add(task);
      }
    });
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.name} Calender"),
      ),
      body: StreamBuilder<List<TaskModel>>(
        // filtering tasks*********
        stream: newTaskDB.streamList().map(
              (event) => event
                  .where((element) => element.aBid == widget.aBid)
                  .toList(),
            ),

        builder:
            (BuildContext context, AsyncSnapshot<List<TaskModel>> snapshot) {
          print(snapshot);
          if (snapshot.hasData) {
            List<TaskModel> brandTasks = snapshot.data;
            if (brandTasks.isNotEmpty) {
              _tasks = _groupTasks(brandTasks);
              //print(brandTasks.length);
            }
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Display the Calender
                Card(
                  child: TableCalendar(
                    events: _tasks,
                    initialCalendarFormat: CalendarFormat.month,
                    calendarStyle: CalendarStyle(
                      canEventMarkersOverflow: true,
                      todayColor: Colors.orange,
                      selectedColor: Theme.of(context).primaryColor,
                      todayStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.white),
                    ),
                    headerStyle: HeaderStyle(
                      centerHeaderTitle: true,
                      formatButtonDecoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      formatButtonTextStyle: TextStyle(color: Colors.white),
                      formatButtonShowsNext: false,
                    ),
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    onDaySelected: (date, events) {
                      setState(() {
                        _selectedTasks = events;
                      });
                    },
                    builders: CalendarBuilders(
                      selectedDayBuilder: (context, date, events) => Container(
                        margin: const EdgeInsets.all(4.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          date.day.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      todayDayBuilder: (context, date, events) => Container(
                        margin: const EdgeInsets.all(4.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          date.day.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    calendarController: _controller,
                  ),
                ),
                // Display the tasks names of choosen date
                ..._selectedTasks.map(
                  (task) => ListTile(
                    title: Text(task.name),
                    onTap: () {
                      Navigator.push(
                        context, // Navigation to display task details
                        MaterialPageRoute(
                          builder: (_) => TaskDetailsPage(
                            task: task,
                          ),
                        ),
                      );
                    },
                    onLongPress: () {},
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        // Navigate to addTaskPage to Edit the task
                        IconButton(
                          color: Colors.deepPurple,
                          icon: Icon(Icons.edit),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => AddTaskPage(
                                taskModel: task,
                                aBid: widget.aBid,
                              ),
                            ),
                          ),
                        ),
                        //delete Task
                        IconButton(
                          color: Colors.red,
                          icon: Icon(Icons.delete),
                          onPressed: () => _deleteTask(context, task.id),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      // Navigation to AddTaskPage to add new Task
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddTaskPage(
                aBid: widget.aBid,
                //selectedDate: _controller.selectedDay,
              ),
            ),
          );
        },
      ),
    );
  }

  void _deleteTask(BuildContext context, String id) async {
    if (await _showConfirmationDialog(context)) {
      try {
        await NewTaskDB().deleteTask(id);
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
