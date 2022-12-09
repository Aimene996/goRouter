import 'package:chat/helper/helper.dart';
import 'package:chat/services/database_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //login method
  Future loginwithEmailAndPassword(String email, String password) async {
    User user;
    try {
      user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;
      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //registration method
  Future registrationwithEmailAndPass(
      String fullName, String email, String password) async {
    User user;
    try {
      user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;
      if (user != null) {
        DatabaseServices(uid: user.uid).updateUser(fullName, email);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      return e.message;
    }
  }

  // logout method
  Future signOut() async {
    try {
      await HelperFunction.saveUserLoggedInStatus(false);
      await HelperFunction.saveEmailStatus("");
      await HelperFunction.saveUserNameInStatus("");

      await firebaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }
}
