import 'package:flutter/material.dart';
import 'package:movie_toz/theme.dart';
import 'package:movie_toz/widget/form_login.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimaryColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 61, left: 22, right: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'Login',
                          style: cWhiteTextStyle.copyWith(fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 44),
                  Text(
                    'Sign up with one of following options',
                    style: cGreyTextStyle.copyWith(fontSize: 13),
                  ),
                  const SizedBox(
                    height: 42,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 158,
                        height: 57,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: cBoxColor),
                        child: const Icon(
                          Icons.android,
                          color: cGoldColor,
                        ),
                      ),
                      Container(
                        width: 158,
                        height: 57,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: cBoxColor),
                        child: const Icon(
                          Icons.apple,
                          color: cGoldColor,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 44),

                  // NOTE: FormLogin
                  const SizedBox(height: 10),
                  const FormLogin(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
