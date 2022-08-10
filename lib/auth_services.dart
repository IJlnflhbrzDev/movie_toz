import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // Future signIn() async {
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emailController.text.trim(),
  //       password: passwordController.text.trim(),
  //     );

  //     Get.off(() => Home());
  //   } on FirebaseAuthException catch (e) {
  //     print(e.message);
  //     showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: const Text('An error occured'),
  //         content: Text(
  //           e.message.toString(),

  //           /// <-------------- HERE
  //         ),
  //         actions: [
  //           TextButton(
  //             child: const Text('Close'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  // }

  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
