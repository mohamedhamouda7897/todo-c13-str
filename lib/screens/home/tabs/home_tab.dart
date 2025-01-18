import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c13_str/firebase/firebase_manager.dart';
import 'package:todo_c13_str/models/task_model.dart';
import 'package:todo_c13_str/widgets/event_card_item.dart';

import '../../../providers/user_provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;

  List<String> categories = [
    "All",
    "birthday",
    "book_club",
    "eating",
    "exhibtion",
    "gaming",
    "holiday",
    "meeting",
    "sport",
    "workshop",
  ];

  String selectedCategory = "";

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Column(
          children: [
            Text(
              "Welcome Back ✨",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white),
            ),
            Text(
              userProvider.userModel?.name ?? "",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
        actions: [
          const Icon(
            Icons.sunny,
            color: Colors.white,
          ),
          const SizedBox(
            width: 8,
          ),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Text(
                "EN",
                style: Theme.of(context).textTheme.bodyMedium,
              )),
          const SizedBox(
            width: 8,
          ),
        ],
        shape: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(24),
              bottomLeft: Radius.circular(24),
            ),
            borderSide: BorderSide(color: Colors.transparent)),
        bottom: AppBar(
          shape: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(24),
                bottomLeft: Radius.circular(24),
              )),
          toolbarHeight: 120,
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: false,
          title: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.pin_drop_outlined,
                    color: Colors.white,
                  ),
                  Text(
                    "Cairo , Egypt",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 70,
                child: Center(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 8,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () {
                            selectedIndex = index;
                            selectedCategory = categories[index];
                            if (selectedCategory == "All") {
                              selectedCategory = "";
                            }
                            setState(() {});
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(color: Colors.white),
                                color: categories[index] ==
                                        categories[selectedIndex]
                                    ? Colors.white
                                    : Colors.transparent),
                            child: Text(
                              categories[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color: categories[index] ==
                                              categories[selectedIndex]
                                          ? Theme.of(context).primaryColor
                                          : Colors.white),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: categories.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot<TaskModel>>(
        stream: FirebaseManager.getEvents(selectedCategory),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Something went wrong"));
          }
          if (snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No Tasks"));
          }
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
      ),
    );
  }
}
