import 'package:flutter/material.dart';

class AccBrDetailsText extends StatelessWidget {
  final String text;
  AccBrDetailsText({@required this.text});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        (this.text == null) ? "no value entered" : text,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
