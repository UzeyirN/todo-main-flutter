import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_demo/models/item_data.dart';
import 'package:todo_demo/styles/styles.dart';

class ItemAdder extends StatefulWidget {
  const ItemAdder({super.key});

  @override
  State<ItemAdder> createState() => _ItemAdderState();
}

class _ItemAdderState extends State<ItemAdder> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: TextField(
                onChanged: (data) {},
                controller: textController,
                minLines: 1,
                maxLines: 3,
                autofocus: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            TextButton(
              style: addButtonStyle(context),
              onPressed: () {
                if (textController.text.trim().isNotEmpty) {
                  Provider.of<ItemData>(context, listen: false)
                      .addItem(textController.text);
                  Navigator.pop(context);
                }
              },
              child: const Text(
                'ADD',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
