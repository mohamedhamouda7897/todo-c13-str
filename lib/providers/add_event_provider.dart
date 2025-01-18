import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddEventProvider extends ChangeNotifier {
  List<String> eventsCategories = [
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
  int selectedIndex = 0;

  DateTime selectedDate = DateTime.now();

  String get selectedCategoryName => eventsCategories[selectedIndex];

  changeSelectedDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  changeEventCategory(int value) {
    selectedIndex = value;
    notifyListeners();
  }
}
