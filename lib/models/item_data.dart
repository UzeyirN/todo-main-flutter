import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './item.dart';

class ItemData with ChangeNotifier {
  static late SharedPreferences _sharedPrefItemObject;
  final List<Item> _items = [
    Item(title: 'Go shopping'),
    Item(title: 'Do exercise'),
    Item(title: 'Learn lesson'),
    Item(title: 'Learn lesson'),
  ];

  final List<String> _itemsAsString = [];

  void toggleStatus(int index) {
    _items[index].toggleStatus();
    saveItemDataToSharedPref(_items);
    notifyListeners();
  }

  void addItem(String title) {
    _items.add(
      Item(title: title),
    );
    saveItemDataToSharedPref(_items);
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    saveItemDataToSharedPref(_items);
    notifyListeners();
  }

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  Future<void> createItemSharedPrefObject() async {
    _sharedPrefItemObject = await SharedPreferences.getInstance();
  }

  void saveItemDataToSharedPref(List<Item> items) {
    _itemsAsString.clear();

    for (var item in items) {
      _itemsAsString.add(jsonEncode(item.toMap()));
    }

    _sharedPrefItemObject.setStringList('toDoData', _itemsAsString);
  }

  void loadItemDataFromSharedPref() {
    List<String> tempList = _sharedPrefItemObject.getStringList('toDoData')!;
    _items.clear();
    for (var item in tempList) {
      _items.add(Item.fromMap(jsonDecode(item)));
    }
  }
}
