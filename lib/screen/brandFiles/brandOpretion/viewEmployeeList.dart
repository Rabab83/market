import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:marketApp/model/classes.dart';
import 'package:marketApp/screen/brandFiles/brandOpretion/tasks/addTask.dart';

class ViewEmployeeList extends StatefulWidget {
  @override
  _ViewEmployeeListState createState() => _ViewEmployeeListState();
}

class _ViewEmployeeListState extends State<ViewEmployeeList> {
  @override
  Widget build(BuildContext context) {
    //   CollectionReference users = FirebaseFirestore.instance.collection('users');
    //  var employeeId = users.where('isEmployee',isEqualTo: true);
  var empEmail=  FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                return (doc["email"]);
              })
            });

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('employees List'),
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: StreamBuilder<QuerySnapshot>(
    //       stream: users.where('isEmployee', isEqualTo: true).snapshots(),
    //       builder:
    //           (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //         if (snapshot.hasError) {
    //           return CircularProgressIndicator();
    //         }
    //         if (snapshot.connectionState == ConnectionState.waiting) {
    //           return Text("Loading");
    //         }
    //         return new ListView.builder(
    //           itemCount: snapshot.data != null ? snapshot.data.docs.length : 0,
    //           itemBuilder: (BuildContext context, int index) {
    //             var snap = snapshot.data.docs;
    //             print(snapshot.data.docs);
    //             return new ListTile(
    //               title: new Text(snap[index].data()['email']),
    //               // ignore: unnecessary_statements
    //               onTap: () {
    //                 print(snap[index].id);
    //                 var employeeId = snap[index].id;
    //                 AddTaskPage(employeeId: employeeId);
    //                 Navigator.push(
    //                   context,
    //                   MaterialPageRoute(
    //                     builder: (_) => AddTaskPage(employeeId: employeeId,
    //                     aBid:widget.aBid ,),
    //                   ),
    //                 );
    //               },
    //             );
    //           },
    //         );
    //       },
    //     ),
    //   ),
    // );
  }
}
