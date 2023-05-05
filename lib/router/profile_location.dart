import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuvo/pages/profile_screen.dart';
import 'package:yuvo/widgets/bottom_navigation_design.dart';

class ProfileLocation extends BeamLocation<BeamState> {
  ProfileLocation({Key? key, required this.bottomNavBeamerKey}) : super();

  final GlobalKey<BeamerState> bottomNavBeamerKey;

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: const ValueKey('profile'),
          title: 'Profile',
          type: BeamPageType.noTransition,
          child: Scaffold(
              bottomNavigationBar: BottomNavigationBarWidget(
                beamerKey: bottomNavBeamerKey,
              ),
              body: const ProfileScreen()),
        ),
      ];

  @override
  List get pathBlueprints => ['/profile/:profileId'];
}
