import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({Key? key, required this.title, required this.children})
      : super(key: key);
  final Widget title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      navigationBar: CupertinoNavigationBar(
        middle: title,
      ),
      child: SafeArea(
        child: ListView.builder(
          itemCount: children.count(),
          itemBuilder: (_, i) {
            return children[i];
          },
        ).pOnly(top: 24),
      ),
    );
  }
}
