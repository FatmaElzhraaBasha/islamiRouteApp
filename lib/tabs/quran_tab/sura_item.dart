import 'package:flutter/material.dart';
import 'package:islami_route_app/tabs/quran_tab/quran_resources.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_styles.dart';

class SuraItem extends StatelessWidget {
  int index;

  SuraItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppAssets.iconStar),
            Text('${index + 1}', style: AppStyles.bold16white),
          ],
        ),
        SizedBox(width: width * 0.06),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              QuranResources.englishQuranList[index],
              style: AppStyles.bold20white,
            ),
            Text(
              '${QuranResources.versesNumberList[index]}  Verses',
              style: AppStyles.bold14white,
            ),
          ],
        ),
        Spacer(),
        Text(
          QuranResources.arabicQuranList[index],
          style: AppStyles.bold20white,
        ),
      ],
    );
  }
}
