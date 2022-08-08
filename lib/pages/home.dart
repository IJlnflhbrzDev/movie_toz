import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:movie_toz/introduction_screen.dart';
import 'package:movie_toz/pages/profile.dart';
import 'package:movie_toz/widget/PopularMovieUI.dart';
import 'package:movie_toz/widget/UpcommingMovieUI.dart';
import 'package:movie_toz/widget/judul.dart';
import 'package:movie_toz/widget/slide_img.dart';
import 'package:movie_toz/theme.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cNavColor,
        leading: Transform.rotate(
          angle: -math.pi / 1,
          child: IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => AlertDialog(
                      title: Text('Logout?'),
                      content: Text('Apakah anda benar ingin melakukannya?'),
                      actions: [
                        TextButton(
                          child: Text('Yes'),
                          onPressed: () {
                            _signOut();
                            Navigator.of(context).pushAndRemoveUntil(
                                new MaterialPageRoute(
                                    builder: (context) =>
                                        new IntroductionScreenMovies()),
                                (route) => false);
                            print('Success Logout route in home code ');
                          },
                        ),
                        TextButton(
                          child: Text('No'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    )),
          ),
        ),
        title: Center(
          child: Text(
            'MOVIE TOZ',
          ),
        ),
        actions: <Widget>[
          InkWell(
            onTap: () {
              Get.to(() => MyProfile());
            },
            child: Container(
              padding: const EdgeInsets.only(right: 15.0),
              child: const CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('assets/profile.png'),
              ),
            ),
          )
        ],
      ),
      backgroundColor: cPrimaryColor,
      body: SafeArea(
          bottom: false,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SlideImage(),
                  const SizedBox(height: 20),
                  Judul(textJudul: 'Most Popular'),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 330,
                    child: const PopularMovieUI(),
                  ),
                  Judul(textJudul: 'Upcomming Movies'),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 310,
                    child: const UpcommingMovieUI(),
                  ),
                  const SizedBox(height: 20),
                ],
              )),
            ],
          )),
    );
  }

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print('futurue signout catch $e');
    }
  }
}
