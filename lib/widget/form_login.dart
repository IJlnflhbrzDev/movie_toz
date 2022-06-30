import 'package:movie_toz/pages/home.dart';
import 'package:movie_toz/theme.dart';
import 'package:flutter/material.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({Key? key}) : super(key: key);

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  bool obscureTextInput = true;
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKeyEmail = GlobalKey<FormState>();
    final GlobalKey<FormState> _formKeyPassword = GlobalKey<FormState>();
    const String email = 'ijlnflhbrz@gmail.com';
    const String password = 'admin123';

    // reques access login via whatsapp to naufal

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Email', style: cWhiteTextStyle.copyWith(fontSize: 18)),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: cBoxColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Form(
            key: _formKeyEmail,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  initialValue: 'ijlnflhbrz@gmail.com',
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: cWhiteColor),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    suffixIcon:
                        Icon(Icons.email_outlined, color: cGoldColor, size: 18),
                    hintText: ' ijlnflhbrz@gmail.com',
                    hintStyle: TextStyle(color: cGreyColor),
                    contentPadding: EdgeInsets.all(15),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Email';
                    } else if (value != email) {
                      return 'Email tidak terdaftar';
                    }
                    return null;
                  },
                ),
              ],
            ),
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
          child: Form(
            key: _formKeyPassword,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  style: const TextStyle(color: cWhiteColor),
                  obscureText: obscureTextInput,
                  enableSuggestions: false,
                  initialValue: 'admin123',
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
                    hintText: ' Enter your Password',
                    hintStyle: TextStyle(color: cGreyColor),
                    contentPadding: EdgeInsets.all(15),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Password';
                    } else if (value != password) {
                      return 'Password salah';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),

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
                  primary: Colors.transparent, shadowColor: Colors.transparent),
              onPressed: () {
                if (_formKeyEmail.currentState!.validate() ||
                    _formKeyPassword.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Login  Success')),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Home();
                      },
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Login  not Success')),
                  );
                }
              },
              child: Text(
                'LOG IN',
                style: cWhiteTextStyle.copyWith(fontSize: 18),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
