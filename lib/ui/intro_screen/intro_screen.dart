import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_route_app/ui/home_screen/home_screen.dart';
import 'package:islami_route_app/utils/app_assets.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      pages: [
        PageViewModel(
          title: "",
          body: "",
          backgroundImage: AppAssets.introScreen1,
        ),
        PageViewModel(
          title: "",
          body: "",
          backgroundImage: AppAssets.introScreen2,
        ),
        PageViewModel(
          title: "",
          body: "",
          backgroundImage: AppAssets.introScreen3,
        ),
        PageViewModel(
          title: "",
          body: "",
          backgroundImage: AppAssets.introScreen4,
        ),
        PageViewModel(
          title: "",
          body: "",
          backgroundImage: AppAssets.introScreen5,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back, color: AppColors.primaryColor),
      skip: Text('Skip', style: AppStyles.bold16Primary),
      next: Icon(Icons.arrow_forward, color: AppColors.primaryColor),
      done: Text('Done', style: AppStyles.bold16Primary),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: const EdgeInsets.all(12.0),
      dotsDecorator: const DotsDecorator(
        activeColor: AppColors.primaryColor,
        size: Size(10.0, 10.0),
        color: Colors.white30,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
