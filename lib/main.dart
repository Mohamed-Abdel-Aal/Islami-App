import 'package:flutter/material.dart';
import 'package:islami_app/core/my_theme_data.dart';
import 'package:islami_app/feature/home/home_screen.dart';
import 'package:islami_app/feature/home/tabs/quran/presentation/screens/sura_details_screen.dart';
import 'package:islami_app/feature/onboarding/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  final bool showOnBoarding =
      prefs.getBool(OnboardingScreen.routeName) ?? false;

  runApp(MyApp(showOnBoarding: showOnBoarding));
}

class MyApp extends StatelessWidget {
  final bool? showOnBoarding;
  const MyApp({super.key, required this.showOnBoarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: showOnBoarding == true
          ? HomeScreen.routeName
          : OnboardingScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        OnboardingScreen.routeName: (context) => OnboardingScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
      },
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
