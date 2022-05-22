import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:movie_toz/pages/welcome.dart';
import 'package:movie_toz/theme.dart';
import 'package:lottie/lottie.dart';

class IntroductionScreenMovies extends StatelessWidget {
  const IntroductionScreenMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: const Color(0xff5843BE),
      done: Text("Done", style: cWhiteTextStyle.copyWith(fontSize: 15)),
      showNextButton: true,
      showBackButton: false,
      showSkipButton: true,
      dotsFlex: 5,
      next: const Icon(
        Icons.arrow_forward,
        color: cWhiteColor,
      ),
      skip: Text('Skip', style: cWhiteTextStyle.copyWith(fontSize: 18)),
      back: const Icon(
        Icons.arrow_back,
        color: cWhiteColor,
      ),
      onDone: () {
        Get.to(Welcome());
      },
      pages: [
        PageViewModel(
          title: "Welcome to Movie Toz",
          body:
              "This is a demo app for Movie App. This app is made with Flutter.",
          image: Center(
            child: Container(
              child: Lottie.asset('assets/step-1-welcome.json',
                  fit: BoxFit.contain),
            ),
          ),
          decoration: PageDecoration(
              titleTextStyle: cWhiteTextStyle.copyWith(fontSize: 30),
              bodyTextStyle: const TextStyle(
                  fontWeight: FontWeight.w300,
                  height: 1.5,
                  fontSize: 20,
                  color: Color(0xffFFFFFF)),
              imageFlex: 3,
              bodyFlex: 1),
        ),
        // Step 2 find house Location
        PageViewModel(
          title: "Explore Movie App",
          body: "Browse Your Favorite Movies, All Popular & Upcoming Movies",
          image: Center(
            child: Container(
              decoration: BoxDecoration(),
              child: Lottie.asset('assets/step-2-explore.json',
                  fit: BoxFit.contain),
            ),
          ),
          decoration: PageDecoration(
              titleTextStyle: cWhiteTextStyle.copyWith(fontSize: 30),
              bodyTextStyle: const TextStyle(
                  fontWeight: FontWeight.w300,
                  height: 1.5,
                  fontSize: 20,
                  color: Color(0xffFFFFFF)),
              imageFlex: 3,
              bodyFlex: 1),
        ),
        PageViewModel(
          title: "Enjoy The Movies",
          body: "Keep Calm & Relax Enjoy the Latest Selected Movies",
          image: Center(
            child: Container(
              child:
                  Lottie.asset('assets/step-3-enjoy.json', fit: BoxFit.contain),
            ),
          ),
          decoration: PageDecoration(
              titleTextStyle: cWhiteTextStyle.copyWith(fontSize: 30),
              bodyTextStyle: const TextStyle(
                  fontWeight: FontWeight.w300,
                  height: 1.5,
                  fontSize: 20,
                  color: Color(0xffFFFFFF)),
              imageFlex: 3,
              bodyFlex: 1),
        ),
      ],
    ); //Material App
  }
}
