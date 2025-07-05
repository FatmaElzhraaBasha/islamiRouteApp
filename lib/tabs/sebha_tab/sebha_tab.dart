import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami_route_app/utils/app_assets.dart';
import 'package:islami_route_app/utils/app_colors.dart';

import '../../utils/app_styles.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  double rotationAngle = 0.0;

  List<String> azkar = [
    'سُبْحَانَ اللَّه',
    'الْحَمْدُ لِلَّه',
    'اللَّهُ أَكْبَر',
    'لَا إِلَهَ إِلَّا اللَّه',
    'أَسْتَغْفِرُ اللَّه',
  ];
  int currentZikrIndex = 0;

  void incrementCounter() {
    setState(() {
      counter++;
      rotationAngle += pi / 15;

      if (counter % 33 == 0) {
        currentZikrIndex = (currentZikrIndex + 1) % azkar.length;
      }
    });
  }

  void resetCounter() {
    setState(() {
      counter = 0;
      rotationAngle = 0.0;
      currentZikrIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: width * 0.06),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
              style: AppStyles.bold36white,
            ),
          ),
          Expanded(
            flex: 7,
            child: Stack(
              children: [
                Column(
                  children: [
                    Image.asset(AppAssets.sebhaSide),
                    AnimatedRotation(
                      turns: rotationAngle / (2 * pi),
                      duration: Duration(milliseconds: 400),
                      child: Image.asset(AppAssets.sebhaImage2),
                    ),
                  ],
                ),
                InkWell(
                  splashColor: AppColors.transparentColor,
                  highlightColor: AppColors.transparentColor,
                  onTap: incrementCounter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: height * 0.05),
                      Text(
                        azkar[currentZikrIndex],
                        textAlign: TextAlign.center,
                        style: AppStyles.bold36white,
                      ),
                      SizedBox(height: height * 0.01),
                      Text(
                        '$counter',
                        textAlign: TextAlign.center,
                        style: AppStyles.bold36white,
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: resetCounter,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.01,
                          vertical: height * 0.01,
                        ),
                      ),
                      child: Text('reset', style: AppStyles.bold14Black),
                    ),
                    SizedBox(height: height * 0.03),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
