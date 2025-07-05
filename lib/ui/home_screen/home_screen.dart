import 'package:flutter/material.dart';

import '../../tabs/hadeth_tab/hadeth_tab.dart';
import '../../tabs/quran_tab/quran_tab.dart';
import '../../tabs/radio_tab/radio_tab.dart';
import '../../tabs/sebha_tab/sebha_tab.dart';
import '../../tabs/time_radio/time_tab.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> backGroundImages = [
    AppAssets.quranBg,
    AppAssets.hadethBg,
    AppAssets.sebhaBg,
    AppAssets.radioBg,
    AppAssets.timeBg,
  ];

  List<Widget> tabs = [
    QuranTab(), HadethTab(), SebhaTab(), RadioTab(), TimeTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(backGroundImages[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,),
        Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: AppColors.primaryColor
            ),
            child: BottomNavigationBar(
              //backgroundColor: AppColors.primaryColor,
              //  type: BottomNavigationBarType.fixed,
                currentIndex: selectedIndex,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {

                  });
                },

                items: [
                  BottomNavigationBarItem(icon: builtBottomNavigationBar(
                      index: 0, imageName: AppAssets.iconQuran),
                      label: 'Quran'),
                  BottomNavigationBarItem(icon: builtBottomNavigationBar(
                      index: 1, imageName: AppAssets.iconHadith),
                      label: 'Hadeth'),
                  BottomNavigationBarItem(icon: builtBottomNavigationBar(
                      index: 2, imageName: AppAssets.iconSebha),
                      label: 'Sebha'),
                  BottomNavigationBarItem(icon: builtBottomNavigationBar(
                      index: 3, imageName: AppAssets.iconRadio),
                      label: 'Radio'),
                  BottomNavigationBarItem(icon: builtBottomNavigationBar(
                      index: 4, imageName: AppAssets.iconTime),
                      label: 'Time'),
                ]

            ),
          ),
          body: Column(
            children: [
              Image.asset(AppAssets.logoBg),
              Expanded(child: tabs[selectedIndex]),
            ],
          ),

        )

      ],

    );
  }

  Widget builtBottomNavigationBar({required int index, required imageName}) {
    return selectedIndex == index ?
    Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(66),
          color: AppColors.blackbgColor,
        ),
        child: ImageIcon(AssetImage(imageName)))
        : ImageIcon(AssetImage(imageName));
  }
}

