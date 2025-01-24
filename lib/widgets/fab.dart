import 'package:flutter/material.dart';

import '../models/item_adder.dart';

//! AS METHOD
FloatingActionButton buildFAB(BuildContext context) {
  return FloatingActionButton(
    onPressed: () {
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return ItemAdder();
        },
      );
    },
    child: Icon(Icons.add),
  );
}

//! AS WIDGET
// class FAB extends StatelessWidget {
//   const FAB({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return FloatingActionButton(
//       onPressed: () {
//         showModalBottomSheet<void>(
//           context: context,
//           builder: (BuildContext context) {
//             return ItemAdder();
//           },
//         );
//       },
//       child: Icon(Icons.add),
//     );
//   }
// }
