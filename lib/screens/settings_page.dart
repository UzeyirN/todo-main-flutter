import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_demo/models/color_theme_data.dart';

import '../styles/styles.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose theme'),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Consumer<ColorThemeData>(
        builder: (context, themeData, child) {
          return _buildSettingsCard(themeData);
        },
      ),
    );
  }

  Card _buildSettingsCard(ColorThemeData themeData) {
    return Card(
      child: SwitchListTile(
        value: _value,
        onChanged: (bool value) {
          setState(() {
            _value = value;
          });
          themeData.switchTheme(value);
        },
        title: _value ? purpleText : greenText,
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: Colors.green,
      ),
    );
  }
}
