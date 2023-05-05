import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:beamer/beamer.dart';

import 'author.dart';

class ActivityItem extends StatelessWidget {
  const ActivityItem({Key? key, required this.item}) : super(key: key);
  final Map<String, String> item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.beamToNamed('/activities/${item['id']}'),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://source.unsplash.com/${item['img']}/200x200")),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
        Row(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 150,
                height: 25,
                child: Text(
                  item['title'] ?? "",
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                      color: Vx.gray900),
                ).pOnly(top: 4),
              ),
              Author(name: item['author'] ?? "", img: "")
            ],
          )
        ])
      ]).pOnly(right: 16),
    );
  }
}
