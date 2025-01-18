import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_c13_str/firebase/firebase_manager.dart';
import 'package:todo_c13_str/models/task_model.dart';
import 'package:todo_c13_str/widgets/event_card_item.dart';

class HomeTab extends StatelessWidget {
  String categoryName;

  HomeTab({required this.categoryName, super.key});


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<TaskModel>>(
      stream: FirebaseManager.getEvents(categoryName),
      builder: (context, snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 16,
            ),
            itemBuilder: (context, index) {
              return EventCardItem(
                model: snapshot.data!.docs[index].data(),
              );
            },
            itemCount: snapshot.data?.docs.length ?? 0,
          ),
        );
      },
    );
  }
}
