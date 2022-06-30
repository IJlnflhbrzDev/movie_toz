import 'package:flutter/material.dart';
import 'package:movie_toz/theme.dart';
import 'package:movie_toz/widget/PopularMovieUI.dart';

class MostPopular extends StatelessWidget {
  const MostPopular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimaryColor,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 7, right: 7),
              margin: const EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // SlideImage(),
                  const SizedBox(height: 33),
                  Padding(
                    padding: const EdgeInsets.only(left: 7, right: 7),
                    child: Text('Most Popular',
                        style: cWhiteTextStyle.copyWith(fontSize: 18)),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  PopularMovieUI(),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 14),
              child: Text('New', style: cWhiteTextStyle.copyWith(fontSize: 18)),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  PopularMovieUI(),
                ],
              ),
            ),
            const SizedBox(height: 82),
          ],
        ),
      ),
    );
  }
}
