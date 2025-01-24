import 'package:flutter/material.dart';
import 'package:todo_demo/styles/styles.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final bool isDone;
  final Function toggleStatus;
  final Function removeAt;

  const ItemCard(
      {super.key,
      required this.title,
      required this.isDone,
      required this.toggleStatus,
      required this.removeAt});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(title),
      onDismissed: (direction) {
        removeAt();
      },
      child: Card(
        elevation: isDone ? 1 : 5,
        child: ListTile(
          title: Text(
            title,
            style: cardTextStyle(isDone),
          ),
          trailing: Checkbox(
            value: isDone,
            onChanged: (data) {
              toggleStatus();
            },
          ),
        ),
      ),
    );
  }
}
