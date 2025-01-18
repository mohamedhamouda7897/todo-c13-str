import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_c13_str/firebase/firebase_manager.dart';
import 'package:todo_c13_str/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel? userModel;
  User? firebaseUser;

  UserProvider() {
    firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      initUser();
    }
  }

  initUser() async {
    firebaseUser = FirebaseAuth.instance.currentUser;

    userModel = await FirebaseManager.readUser(firebaseUser!.uid);
    notifyListeners();
  }
}
