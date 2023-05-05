import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuvo/layout/main_layout.dart';
import 'package:yuvo/widgets/activity_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yuvo/widgets/profile_header.dart';

const List<Map<String, String>> activitiesData = [
  {
    'id': '1',
    'title': 'Lorem ipsum dolor',
    'description':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc condimentum ipsum in eros efficitur, vel eleifend diam porta. Nullam at tempor dui. Pellentesque non tempor eros',
    'img': 'J154nEkpzlQ',
    'author': 'Marco Trombetta',
    'autor-img':
        'https://res.cloudinary.com/crunchbase-production/image/upload/c_thumb,h_256,w_256,f_auto,g_faces,z_0.7,q_auto:eco,dpr_1/ulkb7uo3mvkbgn8op0pp'
  },
  {
    'id': '2',
    'title': 'Dolor sit amet',
    'description':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc condimentum ipsum in eros efficitur, vel eleifend diam porta. Nullam at tempor dui. Pellentesque non tempor eros',
    'img': 'VmYZe_yqxL0',
    'author': 'Marco Trombetta'
  },
  {
    'id': '3',
    'title': 'Consectetur adipiscing consectetur adipiscing',
    'description':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc condimentum ipsum in eros efficitur, vel eleifend diam porta. Nullam at tempor dui. Pellentesque non tempor eros',
    'img': 'c59hEeerAaI',
    'author': 'Marco Trombetta'
  },
  {
    'id': '4',
    'title': 'Activity 3',
    'description':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc condimentum ipsum in eros efficitur, vel eleifend diam porta. Nullam at tempor dui. Pellentesque non tempor eros',
    'img': 'Vz0RbclzG_w',
    'author': 'Marco Trombetta'
  },
  {
    'id': '5',
    'title': 'Activity 3',
    'description':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc condimentum ipsum in eros efficitur, vel eleifend diam porta. Nullam at tempor dui. Pellentesque non tempor eros',
    'img': 'xNqnwGVQTqs',
    'author': 'Marco Trombetta'
  },
  {
    'id': '6',
    'title': 'Activity 3',
    'description':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc condimentum ipsum in eros efficitur, vel eleifend diam porta. Nullam at tempor dui. Pellentesque non tempor eros',
    'img': 'UjxL9x0nwQ8',
    'author': 'Marco Trombetta'
  },
];

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: const Text('YUVO').text.lg.bold.fontFamily('Pacifico').make(),
        children: [
          ProfileHeader(
            activity: activitiesData[0],
          ).pOnly(left: 16, bottom: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: <Widget>[
                const Text("10k").text.lg.bold.fontFamily('Gilroy').make(),
                const Text("claps")
                    .text
                    .sm
                    .semiBold
                    .fontFamily('Gilroy')
                    .make()
                    .pOnly(left: 3),
              ]),
              Row(children: <Widget>[
                const Text("1.2k").text.lg.bold.fontFamily('Gilroy').make(),
                const Text("followers")
                    .text
                    .sm
                    .semiBold
                    .fontFamily('Gilroy')
                    .make()
                    .pOnly(left: 3),
              ]),
              Row(children: <Widget>[
                const Text("3").text.lg.bold.fontFamily('Gilroy').make(),
                const Text("following")
                    .text
                    .sm
                    .semiBold
                    .fontFamily('Gilroy')
                    .make()
                    .pOnly(left: 3),
              ])
            ],
          ).pOnly(left: 16, right: 16, bottom: 24),
          const ActivityList(
              items: activitiesData, listName: "Marco's activities:")
        ]);
  }
}
