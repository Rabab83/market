import 'package:flutter/material.dart';
import 'package:marketApp/model/classes.dart';

class TaskDetailsPage extends StatelessWidget {
  final TaskModel task;

  const TaskDetailsPage({Key key, this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task details'),
        actions: [
          IconButton(icon: Icon(Icons.edit), onPressed: null),
          IconButton(icon: Icon(Icons.delete), onPressed: null),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              task.name,
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 20.0),
            Text(task.description),
            SizedBox(height: 20.0),
            Text('Task From:'),
            Text(task.employeeId),
            SizedBox(height: 20.0),
            Text('Assigned To:'),
            Text(task.assignedemployeeId),
            SizedBox(height: 20.0),
            Text('Start on:'),
            Text(task.taskdate.toString()),
            SizedBox(height: 20.0),
            Text('Ends on:'),
            Text(task.endDate.toString()),
          ],
        ),
      ),
    );
  }
}
