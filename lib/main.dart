import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:marketApp/app/landing_page.dart';
import 'package:marketApp/screen/pages/dashBoard.dart';
import 'package:marketApp/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marketing App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pinkAccent[700],
        accentColor: Colors.pink[200],
      ),
      home:
          // DashBoardPage(),
          LandingPage(
        auth: Auth(),
      ),
      //  routes: {
      //        "add_task": (_) => AddTaskPage(),

      //        },
    );
  }
}
