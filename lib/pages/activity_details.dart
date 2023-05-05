import 'package:flutter/material.dart';

class ActivityDetailsScreen extends StatelessWidget {
  const ActivityDetailsScreen({Key? key, required this.activity})
      : super(key: key);
  final Map<String, String> activity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(activity['title']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(activity['description']!),
      ),
    );
  }
}
