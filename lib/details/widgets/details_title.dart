import 'package:flutter/material.dart';

class DetailsTile extends StatelessWidget {
  const DetailsTile({
    Key? key,
    required this.text,
    required this.title,
  }) : super(key: key);

  final String text;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.grey,
          fontSize: 18,
        ),
      ),
      subtitle: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontSize: 16,
        ),
      ),
      trailing: const Icon(Icons.navigate_next),
    );
  }
}
