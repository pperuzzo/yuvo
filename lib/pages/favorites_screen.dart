import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const List<Map<String, String>> favoritesData = [
  {
    'id': '1',
    'title': 'Activity 5',
    'description':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc condimentum ipsum in eros efficitur, vel eleifend diam porta. Nullam at tempor dui. Pellentesque non tempor eros',
  },
  {
    'id': '2',
    'title': 'Activity 6',
    'description':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc condimentum ipsum in eros efficitur, vel eleifend diam porta. Nullam at tempor dui. Pellentesque non tempor eros',
  },
  {
    'id': '3',
    'title': 'Activity 7',
    'description':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc condimentum ipsum in eros efficitur, vel eleifend diam porta. Nullam at tempor dui. Pellentesque non tempor eros',
  },
];

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      appBar: AppBar(title: const Text('Favorites')),
      body: ListView(
        children: favoritesData
            .map(
              (favorite) => ListTile(
                title: Text(favorite['title']!),
                subtitle: Text(favorite['description']!),
                onTap: () =>
                    context.beamToNamed('/favorites/${favorite['id']}'),
              ),
            )
            .toList(),
      ),
    );
  }
}
