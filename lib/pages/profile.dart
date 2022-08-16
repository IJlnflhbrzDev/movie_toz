import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:movie_toz/theme.dart';

class MyProfile extends StatelessWidget {
  MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth?.instance.currentUser!;

    final name = user.displayName;
    final email = user.email;
    final photoUrl = user.photoURL;

    final nameNotNull = name != null ? name : email;
    final replaceNameGmail = nameNotNull?.replaceAll('@gmail.com', '');
    return Scaffold(
        backgroundColor: cPrimaryColor,
        appBar: AppBar(
          title: Text('PROFILE'),
          centerTitle: true,
          backgroundColor: cPrimaryColor,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Get.snackbar(
                    "Edit Profile",
                    "Apakah anda ingin melanjutkannya ? ",
                  );
                })
          ],
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 42),
                  Container(
                    width: 100,
                    height: 100,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('$photoUrl'),
                    ),
                  ),
                  const SizedBox(height: 21),
                  Text(
                    '$replaceNameGmail',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '$email',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 239, 239, 239),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
