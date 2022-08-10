import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_toz/pages/login.dart';
import 'package:movie_toz/theme.dart';

import 'home.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
            'Sign up',
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
                  padding: const EdgeInsets.only(top: 61, left: 22, right: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 44),
                      Text(
                        'Sign up with one of following options',
                        style: cGreyTextStyle.copyWith(fontSize: 13),
                      ),
                      const SizedBox(height: 42),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 57,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: cBoxColor),
                                child: const Icon(
                                  Icons.android,
                                  color: cGoldColor,
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
                            Text('Already have an account?',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            TextButton(
                              onPressed: () {
                                Get.to(Login());
                              },
                              child: Text(
                                'Login',
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
                onPressed: signUp,
                child: Text(
                  'Create Account',
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
  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      Get.off(() => Home());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('weak-password'),
            content: Text('Kata sandi yang diberikan terlalu lemah'),
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
      } else if (e.code == 'email-already-in-use') {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('email-already-in-use'),
            content: Text('Email sudah di gunakan'),
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
        print('The account already exists for that email.');
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('ERROR'),
          content: Text('$e'),
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
