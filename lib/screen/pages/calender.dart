import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:marketApp/model/classes.dart';
import 'package:marketApp/screen/brandFiles/brandOpretion/tasks/viewTaskDetails.dart';
import 'package:marketApp/services/crudFunctions.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatefulWidget {
  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _tasks;
  List<dynamic> _selectedTasks;
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
    return StreamBuilder<List<TaskModel>>(
        stream: newTaskDB.streamList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            List<TaskModel> allTasks = snapshot.data;
            if (allTasks.isNotEmpty) {
              _tasks = _groupTasks(allTasks);
            }
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
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
                            borderRadius: BorderRadius.circular(10.0)),
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
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Text(
                            date.day.toString(),
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    calendarController: _controller,
                  ),
                ),
                ..._selectedTasks.map((task) => ListTile(
                      title: Text(task.name),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TaskDetailsPage(
                              task: task,
                            ),
                          ),
                        );
                      },
                    )),
              ],
            ),
          );
        });
  }
}
