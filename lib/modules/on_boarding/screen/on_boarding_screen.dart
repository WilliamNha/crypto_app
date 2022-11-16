import 'package:crypto_tracker_app/constants/app_setting_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      titlePadding: EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 20),
      titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.w700,
          color: AppColor.primaryColor),
      bodyPadding: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    Widget _buildImage(String assetName, [double width = 350]) {
      return SvgPicture.asset('assets/svg/on_boarding/$assetName',
          width: width);
    }

    return IntroductionScreen(
      isBottomSafeArea: true,
      dotsDecorator: DotsDecorator(
          activeColor: AppColor.primaryColor,
          size: const Size.square(12.0),
          activeSize: const Size(20.0, 12.0),
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0))),
      globalBackgroundColor: Colors.white,
      onDone: () {
        context.go('/navigation_bar');
      },
      globalFooter: Container(),
      onSkip: () {},
      showDoneButton: true,
      showNextButton: true,
      showBackButton: true,
      showSkipButton: false,
      back: const Text('Back',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColor.primaryColor)),
      next: const Text("Next",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColor.primaryColor)),
      skip: const Text("Skip"),
      done: const Text("Done",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColor.primaryColor)),
      pages: [
        PageViewModel(
          title: "Best App to Buy Crypto Currency",
          body:
              "Instead of having to buy an entire share, invest any amount you want.",
          image: _buildImage('on_boarding1.svg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Safe & Secure Exchange",
          body:
              "Instead of having to buy an entire share, invest any amount you want.",
          image: _buildImage('on_boarding2.svg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "It's simple for beginner to invest",
          body:
              "Instead of having to buy an entire share, invest any amount you want.",
          image: _buildImage('on_boarding3.svg'),
          decoration: pageDecoration,
        ),
      ],
    );
  }
}
