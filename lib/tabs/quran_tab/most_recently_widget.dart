import 'package:flutter/material.dart';
import 'package:islami_route_app/tabs/quran_tab/quran_resources.dart';
import 'package:provider/provider.dart';

import '../../providers/most_recent_provider.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class MostRecentlyWidget extends StatefulWidget {
  MostRecentlyWidget({super.key});

  @override
  State<MostRecentlyWidget> createState() => _MostRecentlyWidgetState();
}

class _MostRecentlyWidgetState extends State<MostRecentlyWidget> {
  late MostRecentProvider mostRecentProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      mostRecentProvider.getMostRecentSuraList();
    });
  }

  /*void readMostRecentSuraList() async{
    mostRecentList = await getMostRecentSuraList();
    setState(() {

    });
  }*/

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);
    return Visibility(
      visible: mostRecentProvider.mostRecentList.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Most Recently', style: AppStyles.bold16white),
          SizedBox(height: height * 0.01),
          SizedBox(
            height: height * 0.18,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.primaryColor,
                  ),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            QuranResources.englishQuranList[mostRecentProvider
                                .mostRecentList[index]],
                            style: AppStyles.bold24Black,
                          ),
                          Text(
                            QuranResources.arabicQuranList[mostRecentProvider
                                .mostRecentList[index]],
                            style: AppStyles.bold24Black,
                          ),
                          Text(
                            '${QuranResources.versesNumberList[mostRecentProvider.mostRecentList[index]]} verses',
                            style: AppStyles.bold14Black,
                          ),
                        ],
                      ),
                      Image.asset(AppAssets.mostRecentlyIcon),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: width * 0.02);
              },
              itemCount: mostRecentProvider.mostRecentList.length,
            ),
          ),
        ],
      ),
    );
  }
}
