import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuvo/layout/main_layout.dart';
import 'package:yuvo/widgets/activity_list.dart';
import 'package:yuvo/widgets/featured_activity.dart';
import 'package:velocity_x/velocity_x.dart';

const List<Map<String, String>> activitiesData = [
  {
    'id': '1',
    'title': 'Lorem ipsum dolor',
    'description':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc condimentum ipsum in eros efficitur, vel eleifend diam porta. Nullam at tempor dui. Pellentesque non tempor eros',
    'img': 'J154nEkpzlQ',
    'author': 'Pierlorenzo Peruzzo',
    'autor-img':
        'https://res.cloudinary.com/crunchbase-production/image/upload/c_thumb,h_256,w_256,f_auto,g_faces,z_0.7,q_auto:eco,dpr_1/ulkb7uo3mvkbgn8op0pp'
  },
  {
    'id': '2',
    'title': 'Dolor sit amet',
    'description':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc condimentum ipsum in eros efficitur, vel eleifend diam porta. Nullam at tempor dui. Pellentesque non tempor eros',
    'img': 'VmYZe_yqxL0',
    'author': 'Simone Zamparini'
  },
  {
    'id': '3',
    'title': 'Consectetur adipiscing consectetur adipiscing',
    'description':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc condimentum ipsum in eros efficitur, vel eleifend diam porta. Nullam at tempor dui. Pellentesque non tempor eros',
    'img': 'c59hEeerAaI',
    'author': 'Keyvan Rahnamoon'
  },
  {
    'id': '4',
    'title': 'Activity 3',
    'description':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc condimentum ipsum in eros efficitur, vel eleifend diam porta. Nullam at tempor dui. Pellentesque non tempor eros',
    'img': 'Vz0RbclzG_w',
    'author': 'Fabio Grosso'
  },
  {
    'id': '5',
    'title': 'Activity 3',
    'description':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc condimentum ipsum in eros efficitur, vel eleifend diam porta. Nullam at tempor dui. Pellentesque non tempor eros',
    'img': 'xNqnwGVQTqs',
    'author': 'Luca Toni'
  },
  {
    'id': '6',
    'title': 'Activity 3',
    'description':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc condimentum ipsum in eros efficitur, vel eleifend diam porta. Nullam at tempor dui. Pellentesque non tempor eros',
    'img': 'UjxL9x0nwQ8',
    'author': 'Fabio Cannavaro'
  },
  {
    'id': '7',
    'title': 'Activity 3',
    'description':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc condimentum ipsum in eros efficitur, vel eleifend diam porta. Nullam at tempor dui. Pellentesque non tempor eros',
    'img': 'WRncbwcYH3U',
    'author': 'Andrea Colombo'
  },
  {
    'id': '8',
    'title': 'Activity 3',
    'description':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc condimentum ipsum in eros efficitur, vel eleifend diam porta. Nullam at tempor dui. Pellentesque non tempor eros',
    'img': 'Yh2UPFrdYoU',
    'author': 'Marco Trombetta'
  },
  {
    'id': '9',
    'title': 'Activity 3',
    'description':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc condimentum ipsum in eros efficitur, vel eleifend diam porta. Nullam at tempor dui. Pellentesque non tempor eros',
    'img': 'IOLIXd0_fpo',
    'author': 'Sofia Gonzalez'
  },
  {
    'id': '10',
    'title': 'Activity 10',
    'description':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc condimentum ipsum in eros efficitur, vel eleifend diam porta. Nullam at tempor dui. Pellentesque non tempor eros',
    'img': '1Ltm4zrGSVg',
    'author': 'Alberto Zavattoni'
  },
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: const Text('YUVO').text.lg.bold.fontFamily('Pacifico').make(),
        children: [
          FeaturedActivity(
            activity: activitiesData[0],
          ).pOnly(left: 16, bottom: 16),
          const ActivityList(items: activitiesData, listName: "Near you")
        ]);
  }
}
