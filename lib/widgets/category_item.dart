import 'package:flutter/material.dart';

class CategoryEventItem extends StatelessWidget {
  String title;
  bool isSelected;

  CategoryEventItem({required this.title, required this.isSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).primaryColor,
          ),
          color:
              isSelected ? Theme.of(context).primaryColor : Colors.transparent),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: !isSelected ? Theme.of(context).primaryColor : Colors.white),
      ),
    );
  }
}
