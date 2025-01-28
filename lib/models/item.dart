class Item {
  String title;
  bool isDone;

  Item({required this.title, this.isDone = false});

  Map toMap() => {'title': title, 'isDone': isDone};

  Item.fromMap(Map map)
      : title = map['title'],
        isDone = map['isDone'];

  void toggleStatus() {
    isDone = !isDone;
  }
}
