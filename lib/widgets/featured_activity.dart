import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'author.dart';

class FeaturedActivity extends StatelessWidget {
  const FeaturedActivity({Key? key, required this.activity}) : super(key: key);
  final Map<String, String> activity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.beamToNamed('/activities/${activity['id']}'),
      child: Column(children: <Widget>[
        Row(
          children: [
            Expanded(
              child: Container(
                      child: const Text(
                'Featured Activity',
              ).text.xl2.bold.fontFamily('Gilroy').make())
                  .pOnly(bottom: 16),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
                child: Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://source.unsplash.com/Sgey0UZt6HY/500x500")),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            )),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: const Text('Lorem ipsum dolor')
                          .text
                          .xl
                          .fontFamily('Gilroy')
                          .semiBold
                          .make()
                          .pOnly(bottom: 8),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: const Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vehicula.')
                          .text
                          .base
                          .fontFamily('Gilroy')
                          .make(),
                    ),
                  ],
                ),
                const Author(name: "Pierlorenzo Peruzzo", img: "").pOnly(top: 8)
              ],
            ).pOnly(left: 16)),
          ],
        ),
      ]),
    );
  }
}
