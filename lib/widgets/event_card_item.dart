import 'package:flutter/material.dart';
import 'package:todo_c13_str/firebase/firebase_manager.dart';
import 'package:todo_c13_str/models/task_model.dart';

class EventCardItem extends StatelessWidget {
  TaskModel model;

  EventCardItem({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: model.isDone ? Colors.green : Colors.transparent,
              width: 5),
          borderRadius: BorderRadius.circular(18)),
      child: Container(
        height: 250,
        child: Stack(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      "assets/images/${model.category}.png",
                      fit: BoxFit.fill,
                      height: double.infinity,
                    )),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "${model.title}",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Do you want to remove ??"),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        FirebaseManager.deleteEvent(model.id)
                                            .then(
                                          (value) {
                                            Navigator.pop(context);
                                          },
                                        );
                                      },
                                      child: Text("Yes")),
                                  ElevatedButton(
                                      onPressed: () {}, child: Text("No")),
                                ],
                              );
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Icon(
                            Icons.delete,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Icon(
                          Icons.edit,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (model.isDone) {
                            model.isDone = false;
                          } else {
                            model.isDone = true;
                          }

                          FirebaseManager.updateEvent(model);
                        },
                        child: Icon(
                          model.isDone ? Icons.favorite : Icons.favorite_border,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 12, top: 8),
              padding: EdgeInsets.only(
                left: 4,
                right: 4,
              ),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      "${DateTime.fromMillisecondsSinceEpoch(model.date).toString().substring(8, 10)}"),
                  Text("${formatDate(model.date)}"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String formatDate(int milliseconds) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);
    String day = dateTime.day.toString();
    List<String> monthNames = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    String month = monthNames[dateTime.month - 1];

    return "$month";
  }
}
