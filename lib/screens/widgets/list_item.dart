import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.strings, required this.index})
      : super(key: key);
  final List<String> strings;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(radius: 40, child: Text("09:00 Am")),
        title: Text(strings[index]),
        subtitle: Text("body body body"),


      ),
    );
  }
}
