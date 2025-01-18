import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_c13_str/firebase/firebase_manager.dart';
import 'package:todo_c13_str/models/task_model.dart';
import 'package:todo_c13_str/providers/add_event_provider.dart';
import 'package:todo_c13_str/widgets/category_item.dart';

class AddEventScreen extends StatelessWidget {
  static const String routeName = "AddEvent";

  AddEventScreen({super.key});

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddEventProvider(),
      builder: (context, child) {
        var provider = Provider.of<AddEventProvider>(context);
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
            title: Text(
              "Create Event",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      "assets/images/${provider.eventsCategories[provider.selectedIndex]}.png",
                      height: 220,
                    ),
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
                          return InkWell(
                            onTap: () {
                              provider.changeEventCategory(index);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: CategoryEventItem(
                                title: provider.eventsCategories[index],
                                isSelected: provider.selectedIndex == index,
                              ),
                            ),
                          );
                        },
                        itemCount: provider.eventsCategories.length,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: titleController,
                    style: Theme.of(context).textTheme.titleSmall,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 16),
                      labelText: "Title",
                      prefixIcon: Icon(Icons.edit_note),
                      labelStyle: Theme.of(context).textTheme.titleSmall,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Color(0xFF7B7B7B)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Color(0xFF7B7B7B)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Color(0xFF7B7B7B)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: descriptionController,
                    maxLines: 4,
                    style: Theme.of(context).textTheme.titleSmall,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      labelText: "description",
                      labelStyle: Theme.of(context).textTheme.titleSmall,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Color(0xFF7B7B7B)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Color(0xFF7B7B7B)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Color(0xFF7B7B7B)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select Date",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      InkWell(
                        onTap: () async {
                          var chosenDate = await showDatePicker(
                              context: context,
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: ColorScheme.light(
                                      primary: Theme.of(context).primaryColor,
                                      // header background color
                                      onPrimary: Colors.white,
                                      // header text color
                                      onSurface:
                                          Colors.black54, // body text color
                                    ),
                                    textTheme: TextTheme(
                                        bodySmall:
                                            GoogleFonts.aBeeZee(fontSize: 16)),
                                    textButtonTheme: TextButtonThemeData(
                                      style: TextButton.styleFrom(
                                        foregroundColor:
                                            Colors.red, // button text color
                                      ),
                                    ),
                                  ),
                                  child: child!,
                                );
                              },
                              initialDate: provider.selectedDate,
                              firstDate:
                                  DateTime.now().subtract(Duration(days: 365)),
                              lastDate:
                                  DateTime.now().add(Duration(days: 365)));
                          if (chosenDate != null) {
                            provider.changeSelectedDate(chosenDate);
                          }
                        },
                        child: Text(
                          "${provider.selectedDate.toString().substring(0, 10)}",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        TaskModel model = TaskModel(
                            userId: FirebaseAuth.instance.currentUser!.uid,
                            title: titleController.text,
                            description: descriptionController.text,
                            category: provider.selectedCategoryName,
                            date: provider.selectedDate.millisecondsSinceEpoch);
                        FirebaseManager.addEvent(model);
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Add Event",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
