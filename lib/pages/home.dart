import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_toz/theme.dart';
import 'package:movie_toz/widget/PopularMovieUI.dart';
import 'package:movie_toz/widget/UpcommingMovieUI.dart';
import 'package:movie_toz/widget/judul.dart';
import 'package:movie_toz/widget/slide_img.dart';

class Home extends StatelessWidget {
  Home({Key? key, this.email}) : super(key: key);
  final String? email;
  @override
  Widget build(BuildContext context) {
    var users = FirebaseAuth.instance.currentUser;
    print(users);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: cNavColor,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Center(
          child: Text(
            'MOVIE TOZ, $email',
          ),
        ),
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.only(right: 15.0),
            child: const CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('assets/movielogo.png'),
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
              ElevatedButton(
                onPressed: _signOut,
                child: Text('Sign Out'),
              ),
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
    await FirebaseAuth.instance.signOut();
  }
}
