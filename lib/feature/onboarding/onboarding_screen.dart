import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/core/utils/app_color.dart';
import 'package:islami_app/core/utils/assets.dart';
import 'package:shared_preferences/shared_preferences.dart';
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static const String routeName = "OnboardingScreen";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return IntroductionScreen(
      // globalHeader: Image.asset(AppImages.homeLogo),
      pages: [
        PageViewModel(
          titleWidget: buildImage(
            path: AppImages.islamiLogo,
            size: size.height * 0.20,
          ),
          bodyWidget: buildImage(
            path: AppImages.onboarding1,
            size: size.height * 0.40,
            text: "Welcome To Islmi App",
          ),
        ),
        PageViewModel(
          titleWidget: buildImage(
            path: AppImages.islamiLogo,
            size: size.height * 0.20,
          ),
          bodyWidget: buildImage(
            path: AppImages.onboarding2,
            size: size.height * 0.35,
            text: '''Welcome To Islmi App

We Are Very Excited To Have You In Our Community
            ''',
          ),
        ),
        PageViewModel(
          titleWidget: buildImage(
            path: AppImages.islamiLogo,
            size: size.height * 0.20,
          ),
          bodyWidget: buildImage(
            path: AppImages.onboarding3,
            size: size.height * 0.40,
            text: '''Reading the Quran

Read, and your Lord is the Most Generous 
            ''',
          ),
        ),
        PageViewModel(
          titleWidget: buildImage(
            path: AppImages.islamiLogo,
            size: size.height * 0.20,
          ),
          bodyWidget: buildImage(
            path: AppImages.onboarding4,
            size: size.height * 0.40,
            text: '''

        Bearish
            
Praise the name of your Lord, the Most High
''',
          ),
        ),
        PageViewModel(
          titleWidget: buildImage(
            path: AppImages.islamiLogo,
            size: size.height * 0.20,
          ),
          bodyWidget: buildImage(
            path: AppImages.onboarding5,
            size: size.height * 0.40,
            text: '''

    Holy Quran Radio
            
You can listen to the Holy Quran Radio through the application for free and easily
''',
          ),
        ),
      ],
      onDone: () {
        goToHome(context);
        saveOnBoarding();
      },
      onSkip: () {
        goToHome(context);
        saveOnBoarding();
      },
      skip: Text("Skip", style: TextStyle(color: AppColors.primaryGold)),
      next: Text("Next", style: TextStyle(color: AppColors.primaryGold)),
      back: Text("Back", style: TextStyle(color: AppColors.primaryGold)),
      done: Text("Finish", style: TextStyle(color: AppColors.primaryGold)),
      globalBackgroundColor: const Color(0xff202020),
      dotsFlex: 3,
      showBackButton: true,
      showSkipButton: true,
      animationDuration: 500,
      dotsDecorator: DotsDecorator(
        color: Colors.grey,
        activeColor: AppColors.primaryGold,
        activeSize: const Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
}

void goToHome(BuildContext context) {
  Navigator.pushReplacementNamed(context, "HomeScreen");
}

Future<void> saveOnBoarding() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool(OnboardingScreen.routeName, true);
}

Widget buildImage({required String path, required double size, String? text}) {
  return text != null
      ? Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(path, height: size),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryGold,
              ),
            ),
          ],
        )
      : Image.asset(path, height: size);
}
