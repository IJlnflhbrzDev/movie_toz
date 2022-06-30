import 'package:flutter/material.dart';
import 'package:movie_toz/theme.dart';

class Judul extends StatelessWidget {
  final String? textJudul;
  const Judul({Key? key, required this.textJudul}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17, right: 17),
      child: Text(
        '${textJudul}',
        style: cWhiteTextStyle.copyWith(fontSize: 22),
      ),
    );
  }
}
