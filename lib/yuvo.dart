import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:yuvo/providers/authentication_provider.dart';
import 'package:yuvo/router/login_location.dart';
import 'package:yuvo/router/map_location.dart';
import 'package:yuvo/router/profile_location.dart';
import 'router/activities_location.dart';
import 'router/favorites_location.dart';
import 'package:provider/provider.dart';

class Yuvo extends StatefulWidget {
  const Yuvo({Key? key}) : super(key: key);

  @override
  _YuvoState createState() => _YuvoState();
}

class _YuvoState extends State<Yuvo> {
  final routerDelegate = BeamerDelegate(
    initialPath: '/login',
    locationBuilder: SimpleLocationBuilder(
      routes: {
        '*': (context, state) {
          final beamerKey = GlobalKey<BeamerState>();
          return Beamer(
            key: beamerKey,
            routerDelegate: BeamerDelegate(
              locationBuilder: BeamerLocationBuilder(
                beamLocations: [
                  LoginLocation(),
                  ActivitiesLocation(bottomNavBeamerKey: beamerKey),
                  FavoritesLocation(bottomNavBeamerKey: beamerKey),
                  MapLocation(bottomNavBeamerKey: beamerKey),
                  ProfileLocation(bottomNavBeamerKey: beamerKey),
                ],
              ),
              guards: [
                BeamGuard(
                  pathBlueprints: ['/activities', '/profile'],
                  check: (context, location) =>
                      context.read<AuthenticationNotifier>().isAuthenticated,
                  beamToNamed: '/login',
                )
              ],
            ),
          );
        }
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
      backButtonDispatcher: BeamerBackButtonDispatcher(
        delegate: routerDelegate,
      ),
    );
  }
}
