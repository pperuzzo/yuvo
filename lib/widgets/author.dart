import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Author extends StatelessWidget {
  const Author({
    Key? key,
    required this.name,
    required this.img,
  }) : super(key: key);

  final String name;
  final String img;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 15,
        width: 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 20,
              child: CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 20,
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/140x100')),
            ),
            SizedBox(
              width: 130,
              child: Text(
                "By $name",
                overflow: TextOverflow.fade,
                softWrap: false,
                style: const TextStyle(
                    fontSize: 11,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w700,
                    color: Vx.gray700),
              ),
            ),
          ],
        ));
  }
}
