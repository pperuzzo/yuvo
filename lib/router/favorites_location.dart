import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuvo/pages/favorite_detail.dart';
import 'package:yuvo/pages/favorites_screen.dart';
import 'package:yuvo/widgets/bottom_navigation_design.dart';

class FavoritesLocation extends BeamLocation<BeamState> {
  FavoritesLocation({Key? key, required this.bottomNavBeamerKey}) : super();

  final GlobalKey<BeamerState> bottomNavBeamerKey;

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: const ValueKey('favorites'),
          title: 'Favorites',
          type: BeamPageType.noTransition,
          child: Scaffold(
              bottomNavigationBar: BottomNavigationBarWidget(
                beamerKey: bottomNavBeamerKey,
              ),
              body: const FavoritesScreen()),
        ),
        if (state.pathParameters.containsKey('favoriteId'))
          BeamPage(
            key: ValueKey('favorites-${state.pathParameters['favoriteId']}'),
            title: favoritesData.firstWhere((fav) =>
                fav['id'] == state.pathParameters['favoriteId'])['title'],
            child: Scaffold(
              bottomNavigationBar: BottomNavigationBarWidget(
                beamerKey: bottomNavBeamerKey,
              ),
              body: FavoriteDetailsScreen(
                favorite: favoritesData.firstWhere(
                    (fav) => fav['id'] == state.pathParameters['favoriteId']),
              ),
            ),
          ),
      ];

  @override
  List get pathBlueprints => ['/favorites/:favoriteId'];
}
