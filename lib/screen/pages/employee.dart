import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:marketApp/model/classes.dart';
import 'package:marketApp/screen/brandFiles/brandOpretion/tasks/addTask.dart';
import 'package:marketApp/screen/brandFiles/brandOpretion/tasks/viewTaskDetails.dart';
import 'package:marketApp/screen/pages/adminPage.dart';
import 'package:marketApp/services/crudFunctions.dart';
import 'package:table_calendar/table_calendar.dart';

class Employee extends StatefulWidget {
  @override
  _EmployeeState createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _tasks;
  List<dynamic> _selectedTasks;
  List<TaskModel> allTasks;
  final userId = FirebaseAuth.instance.currentUser.email;

  DateTime _taskDate;

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
      if (data[date] == null) data[date] = [];
      data[date].add(task);
    });
    return data;
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Week Tasks '),
      ),
      body: StreamBuilder<List<TaskModel>>(
        //Solving problem of filtering tasks*************************
        stream: newTaskDB.streamList().map((event) =>
            event.where((element) => element.assignedemployeeMail == userId).toList()),
        builder:
            (BuildContext context, AsyncSnapshot<List<TaskModel>> snapshot) {
          if (snapshot.hasData) {
            List<TaskModel> brandTasks = snapshot.data;
            if (brandTasks.isNotEmpty) {
              _tasks = _groupTasks(brandTasks);
            }
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TableCalendar(
                  events: _tasks,
                  initialCalendarFormat: CalendarFormat.week,
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
                  startingDayOfWeek: StartingDayOfWeek.sunday,
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
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text(
                          date.day.toString(),
                          style: TextStyle(color: Colors.white),
                        ),),
                    todayDayBuilder: (context, date, events) => Container(
                        margin: const EdgeInsets.all(4.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text(
                          date.day.toString(),
                          style: TextStyle(color: Colors.white),
                        ),),
                  ),
                  calendarController: _controller,
                ),
                ..._selectedTasks.map((task) => ListTile(
                      title: Text(task.name),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => TaskDetailsPage(
                                      task: task,
                                    ),),);
                      },
                    )),
              ],
            ),
          );
        },
      ),
      // ),
      
    );
  }
}