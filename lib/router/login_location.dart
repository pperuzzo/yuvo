import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuvo/pages/login_screen.dart';

class LoginLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
            key: const ValueKey('login'),
            title: 'Login',
            type: BeamPageType.noTransition,
            child: const Scaffold(
              body: LoginScreen(),
            )),
      ];

  @override
  List get pathBlueprints => ['/login'];
}
