import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:movie_toz/theme.dart';
import 'package:movie_toz/pages/login.dart';

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
              Expanded(child: Image.asset('assets/splash-screen-logo.png')),
              Text('WELCOME TO MOVIETOZ!',
                  style: cWhiteTextStyle.copyWith(fontSize: 30)),
              Text('Click The Button To Get Started',
                  style: cGreyTextStyle.copyWith(fontSize: 18)),
              const SizedBox(height: 50),
              Container(
                width: 330,
                height: 47,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color(0xff373f85),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          // return SignInScreen(
                          //   providerConfigs: [
                          //     EmailProviderConfiguration(),
                          //   ],
                          // );
                          return Login();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'GET STARTED',
                    style: cWhiteTextStyle.copyWith(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
