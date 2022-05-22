// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopBarIcons extends StatefulWidget {
  const TopBarIcons({Key? key}) : super(key: key);

  @override
  State<TopBarIcons> createState() => _TopBarIconsState();
}

class _TopBarIconsState extends State<TopBarIcons> {
  Color _iconColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          iconSize: 25,
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        const Text('MOVIETOZ',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        IconButton(
          iconSize: 25,
          icon: Icon(Icons.star, color: _iconColor),
          onPressed: () {
            setState(() {
              _iconColor = Colors.yellow;
            });
          },
        ),
      ],
    );
  }
}
