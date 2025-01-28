import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_demo/models/item_data.dart';
import 'package:todo_demo/screens/home_page.dart';

import 'models/color_theme_data.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ColorThemeData, ItemData>(
      builder: (context, themeData, itemData, child) {
        themeData.loadThemeDataFromSharedPref();
        itemData.loadItemDataFromSharedPref();
        return MaterialApp(
          title: 'Flutter Demo',
          theme: themeData.selectedThemeData,
          home: HomePage(),
        );
      },
    );
  }
}
