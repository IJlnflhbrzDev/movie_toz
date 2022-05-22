import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_toz/pages/most_popular.dart';
import 'package:movie_toz/theme.dart';

class CardTexts extends StatelessWidget {
  final String? name;
  final String? imgUrl;
  const CardTexts({this.name, this.imgUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(MostPopular()),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
        margin: const EdgeInsets.only(top: 38),
        padding: const EdgeInsets.only(left: 14, right: 14),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Image.asset(
              '$imgUrl',
              width: 150,
              height: 215,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 35),
              child:
                  Text('$name', style: cWhiteTextStyle.copyWith(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
