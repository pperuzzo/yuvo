import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuvo/pages/activity_details.dart';
import 'package:yuvo/pages/home_screen.dart';
import 'package:yuvo/widgets/bottom_navigation_design.dart';

class ActivitiesLocation extends BeamLocation<BeamState> {
  ActivitiesLocation({Key? key, required this.bottomNavBeamerKey}) : super();

  final GlobalKey<BeamerState> bottomNavBeamerKey;

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: const ValueKey('activities'),
          title: 'Activities',
          type: BeamPageType.noTransition,
          child: Scaffold(
              bottomNavigationBar: BottomNavigationBarWidget(
                beamerKey: bottomNavBeamerKey,
              ),
              body: const HomeScreen()),
        ),
        if (state.pathParameters.containsKey('activityId'))
          BeamPage(
            key: ValueKey('activities-${state.pathParameters['activityId']}'),
            title: activitiesData.firstWhere((act) =>
                act['id'] == state.pathParameters['activityId'])['title'],
            child: Scaffold(
              bottomNavigationBar: BottomNavigationBarWidget(
                beamerKey: bottomNavBeamerKey,
              ),
              body: ActivityDetailsScreen(
                activity: activitiesData.firstWhere(
                    (act) => act['id'] == state.pathParameters['activityId']),
              ),
            ),
          ),
      ];

  @override
  List get pathBlueprints => ['/activities/:activityId'];
}
