import 'package:flutter/material.dart';

TextStyle itemCountStyle = TextStyle(
  color: Colors.white,
  fontSize: 24,
  fontWeight: FontWeight.w500,
);

BoxDecoration todoContainerDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(
    Radius.circular(25),
  ),
);

ButtonStyle addButtonStyle(BuildContext context) {
  return TextButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      backgroundColor: Theme.of(context).primaryColor);
}

TextStyle cardTextStyle(bool isDone) {
  return TextStyle(
      decoration: isDone ? TextDecoration.lineThrough : TextDecoration.none);
}

Text purpleText = Text(
  'Purple',
  style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
);
Text greenText = Text(
  'Green',
  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
);
