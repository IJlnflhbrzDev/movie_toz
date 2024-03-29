import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:movie_toz/pages/home.dart';
import 'package:movie_toz/pages/register.dart';
import 'package:movie_toz/theme.dart';
import 'package:flutter/material.dart';

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
          Row(children: [
            Text('Belum Punya Akun?',
                style: TextStyle(color: Colors.white, fontSize: 16)),
            TextButton(
              onPressed: () {
                Get.to(RegisterPage());
              },
              child: Text(
                'Daftar',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    decoration: TextDecoration.underline),
              ),
            )
          ]),

          const SizedBox(height: 100),
          Center(
            child: Container(
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
