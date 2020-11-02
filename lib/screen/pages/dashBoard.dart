import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:marketApp/screen/pages/adminPage.dart';

class DashBoardPage extends StatelessWidget {
  FirebaseAuth fAuth = FirebaseAuth.instance;
  FirebaseFirestore fStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            // header
            new UserAccountsDrawerHeader(
              accountName: Text('Mammdouh'),
              accountEmail: Text('Mammdouh@gmail.com'),
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
            ListTile(
              title: Text('Manager page'),
              leading: Icon(Icons.home),
              onTap: () {
                // final userId = fAuth.currentUser.uid;
                // fStore.collection('users').doc(userId).get().then((snapshot) =>
                //     snapshot.data()['isAdmin'] == "true"?
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminPage()),
                );
                // : Text("you are not allowed to enter this page"));
              },
            ),
            ListTile(
              title: Text('Employee'),
              leading: Icon(Icons.work),
              onTap: () {
                // final userId = fAuth.currentUser.uid;
                // fStore.collection('users').doc(userId).get().then((snapshot) =>
                //     snapshot.data()['role'] == "employee"||snapshot.data()['role'] =="admin"
                //         ? Navigator.push(context,
                //             MaterialPageRoute(
                //                 builder: (context) => Employee()))
                //         : Text("you are not allowed to enter this page"));
              },
            ),
            ListTile(
              title: Text('Client'),
              leading: Icon(Icons.note),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ClientPage()),
                // );
              },
            ),

            ListTile(
              title: Text('Notifications'),
              leading: Icon(Icons.notifications),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(
          'Marketiong App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(children: <Widget>[
          Image.network(
              'https://www.intandemcommunications.co.uk/wp-content/uploads/2019/08/What-is-marketing-500x333.jpg',
              fit: BoxFit.fitWidth,
              width: 500),
          Container(
            margin: const EdgeInsets.all(15),
            child: Text(
              'The best place to Market your Business.',
              style: TextStyle(fontSize: 22.0, color: Colors.pinkAccent),
            ),
          ),
        ]),
      ),
    );
  }
}
