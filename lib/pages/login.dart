import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_toz/pages/register.dart';
import 'package:movie_toz/theme.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'home.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    print('CREDENTIAL = $credential');
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: cPrimaryColor,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Login',
            style: cWhiteTextStyle.copyWith(fontSize: 24),
          ),
        ),
        backgroundColor: cPrimaryColor,
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 44),
                      Text(
                        'Log in with one of following options',
                        style: cGreyTextStyle.copyWith(fontSize: 13),
                      ),
                      const SizedBox(height: 42),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: GestureDetector(
                              onTap: () {
                                signInWithGoogle();
                                Get.to(Home());
                              },
                              child: Container(
                                padding: EdgeInsets.all(18),
                                width: MediaQuery.of(context).size.width,
                                height: 57,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: cBoxColor),
                                child: Image.asset(
                                  'assets/icon-google.png',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 57,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: cBoxColor),
                              child: const Icon(
                                Icons.apple,
                                color: cGoldColor,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 44),

                      // NOTE: FormLogin
                      const SizedBox(height: 10),
                      const FormLogin(),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don’t have an account?',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            TextButton(
                              onPressed: () {
                                Get.to(RegisterPage());
                              },
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // SIGN IN SOCIAL

}

// NOTED FORM LOGIN

class FormLogin extends StatefulWidget {
  const FormLogin({Key? key}) : super(key: key);

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  // Controller TextField
  bool obscureTextInput = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Email', style: cWhiteTextStyle.copyWith(fontSize: 18)),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: cBoxColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: cWhiteColor),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    suffixIcon:
                        Icon(Icons.email_outlined, color: cGoldColor, size: 18),
                    hintText: 'Masukan Email Anda',
                    hintStyle: TextStyle(color: cGreyColor),
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          // Note : this is input type passowrd
          Text('Password', style: cWhiteTextStyle.copyWith(fontSize: 18)),
          const SizedBox(height: 10),

          Container(
            decoration: BoxDecoration(
              color: cBoxColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: passwordController,
                  obscureText: obscureTextInput,
                  textInputAction: TextInputAction.done,

                  style: const TextStyle(color: cWhiteColor),
                  // obscureText: obscureTsextInput,
                  enableSuggestions: false,
                  autocorrect: false,

                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      iconSize: 18.0,
                      icon: Icon(Icons.no_encryption_gmailerrorred_outlined),
                      color: cGoldColor,
                      onPressed: () {
                        setState(() {
                          obscureTextInput = !obscureTextInput;
                        });
                      },
                    ),
                    hintText: 'Masukan Password Anda',
                    hintStyle: TextStyle(color: cGreyColor),
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 100),
          Center(
            child: Container(
              width: Get.width,
              height: 47,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color(0xff373f85),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent),
                onPressed: signIn,
                child: Text(
                  'LOG IN',
                  style: cWhiteTextStyle.copyWith(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Future signIn
  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      Get.off(() => Home());
    } on FirebaseAuthException catch (e) {
      print(e.message);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('An error occured'),
          content: Text(
            e.message.toString(),

            /// <-------------- HERE
          ),
          actions: [
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }
}
