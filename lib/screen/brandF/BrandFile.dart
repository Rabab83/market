import 'package:flutter/material.dart';
import 'package:marketApp/screen/brandFiles/brandDecription/viewBrandDescription.dart';
import 'package:marketApp/screen/brandFiles/brandOpretion/viewBrandCalender.dart';

//Navigation From ViewBrands
class BrandFile extends StatefulWidget {
  final String aBid;
  final String name;
  BrandFile({this.aBid,this.name});
   

  @override
  _BrandFileState createState() => _BrandFileState();
}

class _BrandFileState extends State<BrandFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.name} File"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
            shadowColor: Colors.black,
            margin: EdgeInsets.all(22),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
              child: Container(
                child: InkWell(
                  child: Center(
                    child: Text(
                      'Description',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ViewBrandDescription(
                          aBid: widget.aBid,
                          // name: widget.name,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(22),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
              child: Container(
                child: InkWell(
                  child: Center(
                    child: Text(
                      'Operation',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ViewBrandCalender(
                          name: widget.name,
                          aBid: widget.aBid,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
