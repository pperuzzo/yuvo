import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuvo/pages/map_screen.dart';
import 'package:yuvo/widgets/bottom_navigation_design.dart';

class MapLocation extends BeamLocation<BeamState> {
  MapLocation({Key? key, required this.bottomNavBeamerKey}) : super();

  final GlobalKey<BeamerState> bottomNavBeamerKey;

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: const ValueKey('map'),
          title: 'Map',
          type: BeamPageType.noTransition,
          child: Scaffold(
              bottomNavigationBar: BottomNavigationBarWidget(
                beamerKey: bottomNavBeamerKey,
              ),
              body: const MapScreen()),
        ),
      ];

  @override
  List get pathBlueprints => ['/map/:mapId'];
}
