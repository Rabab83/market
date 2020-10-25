import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:marketApp/screen/brandFiles/brandOpretion/tasks/addTask.dart';
import 'package:marketApp/screen/pages/calender.dart';
import 'package:marketApp/model/classes.dart';
import 'package:marketApp/screen/pages/dashBoard.dart';
import 'package:marketApp/screen/brandF/viewBrands.dart';
import 'package:marketApp/services/crudFunctions.dart';
import 'package:table_calendar/table_calendar.dart';


class AdminPage extends StatefulWidget {
  
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            //        header
            new UserAccountsDrawerHeader(
              accountName: Text('Mammdouh'),
              accountEmail: Text('Mammdouh@gammal.tech'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: new BoxDecoration(color: Colors.pink),
            ),
            //drawer components
            ListTile(
              title: Text('Homepage'),
              leading: Icon(Icons.home),
              onTap: () {
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DashBoardPage()),
              );
              },
            ),
            ListTile(
              title: Text('View Brands'),
              leading: Icon(Icons.work),
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewBrands()),
              );
              },
            ),
            ListTile(
              title: Text('Calender'),
              leading: Icon(Icons.calendar_today),
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => Celander()),
                //   );
              },
            ),
            
          ],
        ),
      ),

       // Body
      body:
       Calender(),
      // Center(
      //   child: Container(
      //     child: Text('Admin Page'),
      //   ),
      // // ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (_) => AddTaskPage(
                
      //         ),
      //       ),
      //     );
      //   },
      // ),
   );
  }
}
