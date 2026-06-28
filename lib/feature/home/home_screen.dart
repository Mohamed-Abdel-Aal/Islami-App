import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_color.dart';
import 'package:islami_app/core/utils/assets.dart';
import 'package:islami_app/feature/home/tabs/hadeth/hadeth_tab.dart';
import 'package:islami_app/feature/home/tabs/quran/presentation/screens/quran_tab.dart';
import 'package:islami_app/feature/home/tabs/radio/radio_tab.dart';
import 'package:islami_app/feature/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_app/feature/home/tabs/time/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> backgroundImages = [
    AppImages.quranBackground,
    AppImages.hadithBackground,
    AppImages.radioBackground,
    AppImages.sebhaBackground,
    AppImages.timeBackground,
  ];
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            backgroundImages[selectedIndex],
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Scaffold(
            bottomNavigationBar: Theme(
              data: Theme.of(
                context,
              ).copyWith(canvasColor: AppColors.primaryGold),
              child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                // type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon: builtItemInBottomNavBar(
                      index: 0,
                      image: AppImages.quranIcon,
                    ),
                    label: "Quran",
                  ),
                  BottomNavigationBarItem(
                    icon: builtItemInBottomNavBar(
                      index: 1,
                      image: AppImages.hadithIcon,
                    ),
                    label: "Hadith",
                  ),
                  BottomNavigationBarItem(
                    icon: builtItemInBottomNavBar(
                      index: 2,
                      image: AppImages.sebhaIcon,
                    ),
                    label: "Sebha",
                  ),
                  BottomNavigationBarItem(
                    icon: builtItemInBottomNavBar(
                      index: 3,
                      image: AppImages.radioIcon,
                    ),
                    label: "Radio",
                  ),
                  BottomNavigationBarItem(
                    icon: builtItemInBottomNavBar(
                      index: 4,
                      image: AppImages.timeIcon,
                    ),
                    label: "Time",
                  ),
                ],
              ),
            ),
            body: tabs[selectedIndex],
          ),
        ],
      ),
    );
  }

  Widget builtItemInBottomNavBar({required int index, required String image}) {
    return selectedIndex == index
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(66),
              color: AppColors.primaryBgDark,
            ),
            child: ImageIcon(AssetImage(image)),
          )
        : ImageIcon(AssetImage(image));
  }
}
