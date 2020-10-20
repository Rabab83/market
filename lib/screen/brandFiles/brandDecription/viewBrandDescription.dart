import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:marketApp/screen/brandFiles/brandDecription/accountBreif/accountBreifDetails.dart';
import 'package:marketApp/screen/brandFiles/brandDecription/accountBreif/addAccountBreif.dart';
import 'package:marketApp/screen/brandFiles/brandDecription/userImagePicker.dart';
import 'package:marketApp/model/classes.dart';
import 'package:marketApp/services/crudFunctions.dart';

// Widget To view Account Breif, brand identity & brand logo
//also, navigation from Brand File
//and navigation to view Account breif details by tapping the account breif name

class ViewBrandDescription extends StatefulWidget {
  final AccountBreif accountBreif;
  final String aBid;
  ViewBrandDescription({this.aBid, this.accountBreif});

  @override
  _ViewBrandDescriptionState createState() => _ViewBrandDescriptionState();
}

class _ViewBrandDescriptionState extends State<ViewBrandDescription> {
  File _userImageFile;
  void _pickedImage(File image) {
    //Receiving the image from UserImagePicker
    _userImageFile = image;
  }

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
              title: Text('Add Account Breif'),
              leading: Icon(Icons.work),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddAccountBreifPage(
                      aBid: widget.aBid,
                      accountBreif: widget.accountBreif,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Upload Brand Identity'),
              leading: Icon(Icons.work),
              onTap: () {},
            ),
            ListTile(
              title: Text('Upload Brand Logo'),
              leading: Icon(Icons.image),
              onTap: () {},
            ),
            ListTile(
              title: Text('Marketing Plan'),
              leading: Icon(Icons.notifications),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Brand Description'),
      ),
      //******************//
      body: //Start of viewing Account Breif
          CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  child: FutureBuilder(
                    future: NewAccountBreifDB().getOneAccountBreif(widget.aBid),
                    // Solving the Error
                    builder: (BuildContext context,
                        AsyncSnapshot<AccountBreif> snapshot) {
                      if (snapshot.hasError || !snapshot.hasData)
                        return Center(child: CircularProgressIndicator());
                      AccountBreif accountBreif = snapshot.data;
                      return Card(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: ListTile(
                            title: Text(accountBreif.name),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                IconButton(
                                  color: Colors.deepPurple,
                                  icon: Icon(Icons.edit),
                                  onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => AddAccountBreifPage(
                                          aBid: widget.aBid,
                                          accountBreif: accountBreif),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  color: Colors.red,
                                  icon: Icon(Icons.delete),
                                  onPressed: () => _deleteAccountBreif(
                                      context, accountBreif.aBid),
                                ),
                              ],
                            ),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => AccountBreifDetailsPage(
                                  aBid: widget.aBid,
                                  accountBreif: accountBreif,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  child: UserImagePicker(_pickedImage),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    // End Of viewing Account Breif
    //Row to load logo image
    // UserImagePicker(),
  }

  void _deleteAccountBreif(BuildContext context, String id) async {
    if (await _showConfirmationDialog(context)) {
      try {
        await NewAccountBreifDB().deleteAccountBreif(id);
      } catch (e) {
        print(e);
      }
    }
  }

  Future<bool> _showConfirmationDialog(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
              content: Text("Are you sure you want to delete?"),
              actions: <Widget>[
                FlatButton(
                  textColor: Colors.red,
                  child: Text("Delete"),
                  onPressed: () => Navigator.pop(context, true),
                ),
                FlatButton(
                  textColor: Colors.black,
                  child: Text("No"),
                  onPressed: () => Navigator.pop(context, false),
                ),
              ],
            ));
  }
}
