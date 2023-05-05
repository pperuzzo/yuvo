import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteDetailsScreen extends StatelessWidget {
  const FavoriteDetailsScreen({Key? key, required this.favorite})
      : super(key: key);
  final Map<String, String> favorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(favorite['title']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(favorite['description']!),
      ),
    );
  }
}
