import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketApp/model/classes.dart';
import 'package:firebase_helpers/firebase_helpers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:marketApp/services/auth.dart';

  FirebaseFirestore _db = FirebaseFirestore.instance;


// firebase CRUD Functions
class NewBrandDB {
  static final NewBrandDB _newBrandDB = NewBrandDB._internal();
  NewBrandDB._internal();

  factory NewBrandDB() {
    return _newBrandDB;
  }

  Future<List<NewBrand>> getBrandsNames() async {
    var snap = await _db.collection('brands').get();
    return snap.docs
        .map((doc) => new NewBrand.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<void> addBrandName(NewBrand newBrand) {
    return _db.collection('brands').doc(newBrand.email).set(newBrand.toMap());
  }
       //Must delete the brand tasks also*********
  Future<void> deleteBrandName(String id) {
    print(id);
    return _db.collection('brands').doc(id).delete();
  }

  Future<void> updateBrandName(NewBrand newBrand) {
    print(newBrand.id);
    return _db.collection('brands').doc(newBrand.id).update(newBrand.toMap());
  }
}

//************************************************************************//
//************************************************************************//
// Calender Events CRUD Functions
DatabaseService<TaskModel> newTaskDB = DatabaseService<TaskModel>("tasks",
    fromDS: (id, data) => TaskModel.fromDS(id, data),
    toMap: (task) => task.toTask());

//************************************************************************//
//************************************************************************//
class NewTaskDB {

  static final NewTaskDB _newTaskDB = NewTaskDB._internal();
  NewTaskDB._internal();

  factory NewTaskDB() {
    return _newTaskDB;
  }

  Future<void> addNewTask(TaskModel taskModel) {
    return _db.collection('tasks').add(taskModel.toTask());
  }

  Future<void> deleteTask(String id) {
    //print(id);
    return _db.collection('tasks').doc(id).delete();
  }

  Future<void> updateTask(TaskModel taskModel) {
    //print(taskModel.id);
    return _db.collection('tasks').doc(taskModel.id).update(taskModel.toTask());
  }
}

//************************************************************************//
//************************************************************************//
//Users CRUD Functions
class UsersDB {
  static final UsersDB _userDB = UsersDB._internal();
  UsersDB._internal();

  factory UsersDB() {
    return _userDB;
  }
  Future<List<User>> getAllEmployess() async {
    var snap = await _db
        .collection('users')
        .where('isEmployee', isEqualTo: true)
        .get();
    return snap.docs
        .map((doc) => new User.fromMap(doc.data(), doc.id))
        .toList();

    // .then((QuerySnapshot querySnapshot) => {
    //       querySnapshot.docs.forEach((doc) {

    //         return doc['email'];
    //       })
    //     });
  }
}

//************************************************************************//
//************************************************************************//
//Account Breif CRUD Functions

class NewAccountBreifDB {
  NewAccountBreifDB._internal();
  static final NewAccountBreifDB _newAccountBreifDB =
      NewAccountBreifDB._internal();

  factory NewAccountBreifDB() {
    return _newAccountBreifDB;
  }

  Future<List<AccountBreif>> getAccountBreifs() async {
    var snap = await _db.collection('accountBreifs').get();
    return snap.docs
        .map((doc) => new AccountBreif.fromAccountBreif(doc.data(), doc.id))
        .toList();
  }

  Future<AccountBreif> getOneAccountBreif(String aBid) async {
    var accounts = getAccountBreifs();
    var account = await accounts
        .then((value) => value.firstWhere((element) => element.aBid == aBid));

    return account;
  }

  Future<void> addAccountBreif(AccountBreif accountBreif) {
    return _db
        .collection('accountBreifs')
        .doc(accountBreif.aBid)
        .set(accountBreif.toAccountBreif());
  }

  Future<void> deleteAccountBreif(String id) {
    return _db.collection('accountBreifs').doc(id).delete();
  }

  Future<void> updateAccountBreif(AccountBreif accountBreif) {
    return _db
        .collection('accountBreifs')
        .doc(accountBreif.aBid)
        .update(accountBreif.toAccountBreif());
  }

  Future<void> initializaAccountBreif(AccountBreif accountBreif) {
    return _db
        .collection('accountBreifs')
        .doc(accountBreif.aBid)
        .set(accountBreif.initialAccountBreif());
  }
}
