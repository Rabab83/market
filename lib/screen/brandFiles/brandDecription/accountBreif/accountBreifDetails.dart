import 'package:flutter/material.dart';
import 'package:marketApp/model/classes.dart';

class AccountBreifDetailsPage extends StatefulWidget {
  String aBid;
  final AccountBreif accountBreif;
  AccountBreifDetailsPage({this.accountBreif,this.aBid});

  @override
  _AccountBreifDetailsPageState createState() =>
      _AccountBreifDetailsPageState();
}

class _AccountBreifDetailsPageState extends State<AccountBreifDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Breif Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.accountBreif.name,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            const SizedBox(height: 20.0),
            Text(
              widget.accountBreif.industry,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
