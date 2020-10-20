import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:marketApp/model/classes.dart';
import 'package:marketApp/screen/brandFiles/brandOpretion/tasks/addEvent.dart';
import 'package:marketApp/screen/brandFiles/brandOpretion/tasks/viewEventDetaild.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:marketApp/services/crudFunctions.dart';

//Widget that is used to view each Brand Tasks
//Navigation from "BrandFile" widget
class ViewBrandCalender extends StatefulWidget {
  final String aBid;
  ViewBrandCalender({this.aBid});

  @override
  _ViewBrandCalenderState createState() => _ViewBrandCalenderState();
}

class _ViewBrandCalenderState extends State<ViewBrandCalender> {
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
          task.taskDate.year, task.taskDate.month, task.taskDate.day, 12);
      if (data[date] == null) data[date] = [];
      data[date].add(task);
    });
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brand Tasks Calender'),
      ),
      body: FutureBuilder<List<TaskModel>>(
        // stream: newTaskDB.streamList(),
        future: NewTaskDB().getBrandTasks(widget.aBid),
        builder:
            (BuildContext context, AsyncSnapshot<List<TaskModel>> snapshot) {
          if (snapshot.hasData) {
            List<TaskModel> allTasks = snapshot.data; //all tasks of this Brand
            if (allTasks.isNotEmpty) {
              _tasks = _groupTasks(allTasks);
            }
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TableCalendar(
                  events: _tasks,
                  initialCalendarFormat: CalendarFormat.month,
                  calendarStyle: CalendarStyle(
                      canEventMarkersOverflow: true,
                      todayColor: Colors.orange,
                      selectedColor: Theme.of(context).primaryColor,
                      todayStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.white)),
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
                  onDaySelected: (date, tasks) {
                    setState(() {
                      _selectedTasks = tasks;
                    });
                  },
                  builders: CalendarBuilders(
                    selectedDayBuilder: (context, date, tasks) => Container(
                        margin: const EdgeInsets.all(4.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text(
                          date.day.toString(),
                          style: TextStyle(color: Colors.white),
                        )),
                    todayDayBuilder: (context, date, tasks) => Container(
                        margin: const EdgeInsets.all(4.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          date.day.toString(),
                          style: TextStyle(color: Colors.white),
                        )),
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
                            ),
                          ),
                        );
                      },
                    )),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddTaskPage(
                aBid: widget.aBid,
              ),
            ),
          );
        },
      ),
    );
  }
}
