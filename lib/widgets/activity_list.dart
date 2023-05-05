import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'activity_item.dart';

class ActivityList extends StatelessWidget {
  const ActivityList({Key? key, required this.items, required this.listName})
      : super(key: key);
  final List<Map<String, String>> items;
  final String listName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                      child: Text(
                listName,
              ).text.xl.bold.fontFamily('Gilroy').make())
                  .pOnly(left: 16, bottom: 8),
            )
          ],
        ),
        SizedBox(
          height: 190,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.count(),
            itemBuilder: (_, i) => ActivityItem(item: items[i]),
          ).pOnly(left: 16),
        ),
      ],
    ).py16();
  }

  // Widget _buildBox({required Color color}) => Container(
  //     margin: const EdgeInsets.all(12), height: 200, width: 200, color: color);
}
