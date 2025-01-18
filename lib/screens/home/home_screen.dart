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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

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
