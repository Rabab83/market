import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketApp/model/classes.dart';
import 'package:firebase_helpers/firebase_helpers.dart';
import 'package:firebase_core/firebase_core.dart';

// firebase CRUD Functions
class NewBrandDB {
  static final NewBrandDB _newBrandDB = NewBrandDB._internal();
  FirebaseFirestore _db = FirebaseFirestore.instance;
  NewBrandDB._internal();

  factory NewBrandDB() {
    return _newBrandDB;
  }

  Future<List<NewBrand>> getBrandsNames() async {
    var snap = await _db.collection('users').get();
    return snap.docs
        .map((doc) => new NewBrand.fromMap(doc.data(), doc.id))
        .toList();
  }

  // Future<dynamic> getOneBrandName(NewBrand newBrand) async {
  //   DocumentSnapshot snap =
  //       await _db.collection('users').doc(newBrand.id).get();
  //   return snap.data();
  // }

  Future<void> addBrandName(NewBrand newBrand) {
    return _db.collection('users').doc(newBrand.email).set(newBrand.toMap());
  }

  Future<void> deleteBrandName(String id) {
    return _db.collection('users').doc(id).delete();
  }

  Future<void> updateBrandName(NewBrand newBrand) {
    return _db.collection('users').doc(newBrand.id).update(newBrand.toMap());
  }
}

//************************************************************************//
//************************************************************************//
//       // Calender Events CRUD Functions
// DatabaseService<TaskModel > taskDBS = DatabaseService<TaskModel >("tasks",
//     fromDS: (id, data) => TaskModel .fromTask(id, data),
//     toMap: (task) => task.toTask());
//************************************************************************//
//************************************************************************//
class NewTaskDB {
  static final NewTaskDB _newTaskDB = NewTaskDB._internal();
  FirebaseFirestore _db = FirebaseFirestore.instance;
  NewTaskDB._internal();

  factory NewTaskDB() {
    return _newTaskDB;
  }

  Future<List<TaskModel>> getAllTasks() async {
    var snap = await _db.collection('tasks').get();
    return snap.docs
        .map((doc) => new TaskModel.fromTask(doc.data(), doc.id))
        .toList();
  }

  Future<List<TaskModel>> getBrandTasks(String aBid) async {
    var allTasks = getAllTasks();
    var brandTasks = await allTasks.then(
        (value) => value.where((element) => element.aBid == aBid).toList());

    // .then((value) => value.where((element) => element.aBid == aBid));
    //     await _db.collection('events').doc(eventModel.aBid).get();
    // return snap.data();
    return brandTasks;
  }

  Future<void> addNewTask(TaskModel taskModel) {
    return _db.collection('tasks')
           .doc(taskModel.aBid) 
           .set(taskModel.toTask());
  }

  Future<void> deleteTask(String id) {
    return _db.collection('tasks').doc(id).delete();
  }

  Future<void> updateTask(TaskModel taskModel) {
    return _db
        .collection('tasks')
        .doc(taskModel.aBid)
        .update(taskModel.toTask());
  }
}

//************************************************************************//
//************************************************************************//
//Account Breif CRUD Functions

class NewAccountBreifDB {
  NewAccountBreifDB._internal();
  static final NewAccountBreifDB _newAccountBreifDB =
      NewAccountBreifDB._internal();
  FirebaseFirestore _db = FirebaseFirestore.instance;

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
