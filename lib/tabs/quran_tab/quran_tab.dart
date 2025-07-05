import 'package:flutter/material.dart';
import 'package:islami_route_app/tabs/quran_tab/most_recently_widget.dart';
import 'package:islami_route_app/tabs/quran_tab/quran_resources.dart';
import 'package:islami_route_app/tabs/quran_tab/sura_details_screen.dart';
import 'package:islami_route_app/tabs/quran_tab/sura_item.dart';
import 'package:islami_route_app/utils/shared_prefs.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(114, (index) => index);

  /* void addFilterList(){
    for(int i=0 ; i<114 ; i++){
      filterList.add(i);
    }
  }*/
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            style: AppStyles.bold16white,
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
              ),
              prefixIcon: Image.asset(AppAssets.iconSearch),
              hintText: 'suraName',
              hintStyle: AppStyles.bold16white,
            ),
            onChanged: (newText) {
              searchByNewText(newText);
            },
          ),
          SizedBox(height: height * 0.02),
          MostRecentlyWidget(),
          SizedBox(height: height * 0.02),
          Text('Suras List', style: AppStyles.bold16white),
          SizedBox(height: height * 0.02),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    saveNewSuraList(filterList[index]);
                    Navigator.of(context).pushNamed(
                      SuraDetailsScreen.routeName,
                      arguments: filterList[index],
                    );
                  },
                  child: SuraItem(index: filterList[index]),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColors.whiteColor,
                  thickness: 2,
                  indent: width * 0.1,
                  endIndent: width * 0.05,
                );
              },
              itemCount: filterList.length,
            ),
          ),
        ],
      ),
    );
  }

  void searchByNewText(String newText) {
    List<int> filterSearchList = [];
    for (int i = 0; i < QuranResources.englishQuranList.length; i++) {
      if (QuranResources.englishQuranList[i].toLowerCase().contains(
        newText.toLowerCase(),
      )) {
        filterSearchList.add(i);
      }
      if (QuranResources.arabicQuranList[i].contains(newText)) {
        filterSearchList.add(i);
      }
    }
    filterList = filterSearchList;
    setState(() {});
  }
}
