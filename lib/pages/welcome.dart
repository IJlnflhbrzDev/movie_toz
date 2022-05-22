import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_toz/pages/login.dart';
import 'package:movie_toz/theme.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/splash-screen-logo.png'),
              Text('WELCOME TO MOVIETOZ!',
                  style: cWhiteTextStyle.copyWith(fontSize: 30)),
              Text('Click The Button To Get Started',
                  style: cGreyTextStyle.copyWith(fontSize: 18)),
              const SizedBox(height: 120),
              Container(
                width: 330,
                height: 47,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color(0xff373f85),
                  // gradient: const LinearGradient(
                  //   colors: [
                  //     // Color.fromARGB(255, 88, 88, 88),
                  //     Color.fromARGB(169, 136, 91, 1),
                  //     Color(0XFFFF722A)
                  //   ],
                  // ),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent),
                  onPressed: () {
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (BuildContext context) => const Login()));
                    Get.to(Login());
                  },
                  child: Text(
                    'GET STARTED',
                    style: cWhiteTextStyle.copyWith(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
