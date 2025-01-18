import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_c13_str/models/task_model.dart';
import 'package:todo_c13_str/models/user_model.dart';

class FirebaseManager {
  static CollectionReference<TaskModel> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (model, _) {
        return model.toJson();
      },
    );
  }

  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (model, _) {
        return model.toJson();
      },
    );
  }

  static Future<void> addEvent(TaskModel model) {
    var collection = getTasksCollection();
    var docRef = collection.doc();
    model.id = docRef.id;
    return docRef.set(model);
  }

  static Future<void> addUser(UserModel model) {
    var collection = getUsersCollection();
    var docRef = collection.doc(model.id);
    return docRef.set(model);
  }

  static Future<UserModel?> readUser(String id) async {
    var collection = getUsersCollection();
    DocumentSnapshot<UserModel> doc = await collection.doc(id).get();
    return doc.data();
  }

  static Stream<QuerySnapshot<TaskModel>> getEvents(String categoryName) {
    var collection = getTasksCollection();

    if (categoryName == "") {
      return collection
          .orderBy("date")
          .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots();
    } else {
      return collection
          .orderBy("date")
          .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .where("category", isEqualTo: categoryName)
          .snapshots();
    }
  }

  static Future<void> deleteEvent(String id) {
    var collection = getTasksCollection();

    return collection.doc(id).delete();
  }

  static Future<void> updateEvent(TaskModel model) {
    var collection = getTasksCollection();

    return collection.doc(model.id).update(model.toJson());
  }

  static Future<void> createAccount(String name, String email, String password,
      Function onLoading, Function onSuccess, Function onError) async {
    try {
      onLoading();

      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      credential.user!.sendEmailVerification();
      UserModel model = UserModel(
          email: email,
          name: name,
          id: credential.user!.uid,
          createdAt: DateTime.now().millisecondsSinceEpoch);
      await addUser(model);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError(e.message);
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        onError(e.message);

        print('The account already exists for that email.');
      }
    } catch (e) {
      onError("Something went wrong");

      print(e);
    }
  }

  static void resetPassword() {
    FirebaseAuth.instance
        .sendPasswordResetEmail(email: "mohamed.hamouda9879@gmail.com");
  }

  static Future<void> login(String email, String password, Function onLoading,
      Function onSuccess, Function onError) async {
    try {
      onLoading();

      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // if (credential.user!.emailVerified) {
      onSuccess();
      // } else {
      //   onError("Please verify your mail");
      // }
    } on FirebaseAuthException catch (e) {
      onError("Wrong username or password");
      // if (e.code == 'user-not-found') {
      //   print('No user found for that email.');
      // } else if (e.code == 'wrong-password') {
      //   print('Wrong password provided for that user.');
      // }
    }
  }

  static void logOut() {
    FirebaseAuth.instance.signOut();
  }
}
