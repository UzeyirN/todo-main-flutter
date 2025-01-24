import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_demo/models/color_theme_data.dart';
import 'package:todo_demo/models/item_data.dart';

import 'my_app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ItemData>(
          create: (BuildContext context) => ItemData(),
        ),
        ChangeNotifierProvider<ColorThemeData>(
          create: (BuildContext context) => ColorThemeData(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
