import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_c13_str/models/task_model.dart';

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

  static Future<void> addEvent(TaskModel model) {
    var collection = getTasksCollection();
    var docRef = collection.doc();
    model.id = docRef.id;
    return docRef.set(model);
  }

  static Stream<QuerySnapshot<TaskModel>> getEvents(String categoryName) {
    var collection = getTasksCollection();

    if (categoryName == "") {
      return collection.orderBy("date").snapshots();
    } else {
      return collection
          .orderBy("date")
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
}
