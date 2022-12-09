import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  final String? uid;
  DatabaseServices({this.uid});
//create a refrence
  CollectionReference collectionUsers =
      FirebaseFirestore.instance.collection("users");
  CollectionReference collectiongroups =
      FirebaseFirestore.instance.collection("groups");

  Future updateUser(String fullName, String email) async {
    return await collectionUsers.doc(uid).set({
      "fullName": fullName,
      "email": email,
      "group": [],
      "profilePic": '',
      "uid": uid,
    });
  }
}
