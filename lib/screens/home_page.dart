import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_demo/screens/settings_page.dart';
import 'package:todo_demo/widgets/fab.dart';

import '../models/item_data.dart';
import '../styles/styles.dart';
import '../widgets/item_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'GET IT DONE',
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SettingsPage(),
              ),
            ),
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Consumer<ItemData>(
        builder: (context, itemData, child) => Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  '${itemData.items.length} items',
                  style: itemCountStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(12),
                decoration: todoContainerDecoration,
                child: ListView.builder(
                  itemCount: itemData.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemCard(
                      title: itemData.items[index].title,
                      isDone: itemData.items[index].isDone,
                      toggleStatus: () => itemData.toggleStatus(index),
                      removeAt: () => itemData.removeItem(index),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: buildFAB(context),
    );
  }
}
