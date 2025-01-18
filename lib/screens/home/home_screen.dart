import 'package:flutter/material.dart';
import 'package:todo_c13_str/screens/add_event.dart';
import 'package:todo_c13_str/screens/home/tabs/home_tab.dart';
import 'package:todo_c13_str/screens/home/tabs/love_tab.dart';
import 'package:todo_c13_str/screens/home/tabs/map_tab.dart';
import 'package:todo_c13_str/screens/home/tabs/profile_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    return Scaffold(
      extendBody: true,
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
              "John Safwat",
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
                            selectedCategory = categories[index];
                            if (selectedCategory == "All") {
                              selectedCategory = "";
                            }
                            setState(() {});
                          },
                          child: Text(
                            categories[index],
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: Colors.white),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddEventScreen.routeName);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (value) {
              selectedIndex = value;
              setState(() {});
            },
            backgroundColor: Colors.transparent,
            elevation: 0,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.map_outlined), label: "Map"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.heart_broken_outlined), label: "Love"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_outlined), label: "Profile"),
            ]),
      ),
      body: [
        HomeTab(
          categoryName: selectedCategory,
        ),
        MapTab(),
        LoveTab(),
        ProfileTab(),
      ][selectedIndex],
    );
  }

// List<Widget> tabs = [
//   HomeTab(
//     categoryName: "eating",
//   ),
//   MapTab(),
//   LoveTab(),
//   ProfileTab(),
// ];
}
