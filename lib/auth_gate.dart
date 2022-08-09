import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_toz/introduction_screen.dart';
import 'package:movie_toz/pages/home.dart';
import 'package:movie_toz/pages/welcome.dart';

class AuthGate extends StatelessWidget {
  AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      initialData: FirebaseAuth.instance.currentUser,
      builder: (context, snapshot) {
        try {
          if (snapshot.hasData) {
            return Home();
          }
        } on FirebaseAuthException catch (e) {
          print('Failed with error code: ${e.code}');
          print(e.message);
        }

        return Welcome();
      },
    );
  }
}
