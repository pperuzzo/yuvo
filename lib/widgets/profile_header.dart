import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key, required this.activity}) : super(key: key);
  final Map<String, String> activity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.beamToNamed('/activities/${activity['id']}'),
      child: Column(children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              height: 140,
              width: 140,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://source.unsplash.com/Z5vZCy8xDZU/500x500")),
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
            ),
          ],
        ),
        Row(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Marco Bombetta",
                overflow: TextOverflow.fade,
                softWrap: false,
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w700,
                    color: Vx.gray900),
              ),
              const Text(
                "@ilbomba",
                overflow: TextOverflow.fade,
                softWrap: false,
                style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w700,
                    color: Vx.gray700),
              ).pOnly(top: 2),
              const Text(
                "Milan - Boston. Mechanical Engineer. Harvard University.",
                overflow: TextOverflow.fade,
                softWrap: false,
                style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w500,
                    color: Vx.gray700),
              ).pOnly(top: 12)
            ],
          )
        ]).pOnly(top: 16)
      ]),
    );
  }
}
