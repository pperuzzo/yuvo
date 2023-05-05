import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuvo/router/activities_location.dart';
import 'package:velocity_x/velocity_x.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({Key? key, required this.beamerKey})
      : super(key: key);

  final GlobalKey<BeamerState> beamerKey;

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  late BeamerDelegate _beamerDelegate;
  int _currentIndex = 0;

  void _setStateListener() => setState(() {});

  @override
  void initState() {
    super.initState();
    _beamerDelegate = widget.beamerKey.currentState!.routerDelegate;
    _beamerDelegate.addListener(_setStateListener);
  }

  @override
  Widget build(BuildContext context) {
    _currentIndex =
        _beamerDelegate.currentBeamLocation is ActivitiesLocation ? 0 : 1;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Vx.gray600,
      currentIndex: _currentIndex,
      selectedFontSize: 13,
      items: const [
        BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              CupertinoIcons.home,
              color: Vx.gray900,
            )),
        BottomNavigationBarItem(
            label: 'Map',
            icon: Icon(
              CupertinoIcons.map,
              color: Vx.gray900,
            )),
        BottomNavigationBarItem(
            label: 'Saved',
            icon: Icon(
              CupertinoIcons.star,
              color: Vx.gray900,
            )),
        BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(
              CupertinoIcons.profile_circled,
              color: Vx.gray900,
            )),
      ],
      onTap: (index) => _beamerDelegate.beamToNamed(_getRoute(index: index)),
    );
  }

  @override
  void dispose() {
    _beamerDelegate.removeListener(_setStateListener);
    super.dispose();
  }

  String _getRoute({required int index}) {
    if (index == 0) {
      return '/activities';
    } else if (index == 1) {
      return '/map';
    } else if (index == 3) {
      return '/profile';
    } else {
      return '/favorites';
    }
  }
}
