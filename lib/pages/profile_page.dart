import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'images/me.JPG',
          width: 200,
          height: 200,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Akhmal Dimas Pratama',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '123200047',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'IF- H',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Hobby: Musik, Game, dan Coding',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
