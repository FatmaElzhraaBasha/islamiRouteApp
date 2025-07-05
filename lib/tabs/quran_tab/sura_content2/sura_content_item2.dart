import 'package:flutter/material.dart';
import 'package:islami_route_app/utils/app_styles.dart';

typedef onContainerClicks = void Function();

class SuraContentItem2 extends StatelessWidget {
  String suraContent;

  SuraContentItem2({super.key, required this.suraContent});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Text(
      suraContent,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
      style: AppStyles.bold20PrimaryHeight2,
    );
  }
}
