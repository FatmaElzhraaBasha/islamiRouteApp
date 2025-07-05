import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_route_app/tabs/quran_tab/quran_resources.dart';
import 'package:islami_route_app/tabs/quran_tab/sura_content1/sura_content_item.dart';
import 'package:islami_route_app/tabs/quran_tab/sura_content2/sura_content_item2.dart';
import 'package:provider/provider.dart';

import '../../providers/most_recent_provider.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details_screen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  late MostRecentProvider mostRecentProvider;
  List<String> verses = [];
  String suraContent = '';
  int? selectedAyahIndex;
  bool isContainerView = true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mostRecentProvider.getMostRecentSuraList();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);

    int selectedIndex = ModalRoute.of(context)?.settings.arguments as int;

    if (verses.isEmpty) {
      loadSuraFile(selectedIndex);
    }

    if (suraContent.isEmpty) {
      loadSuraFileString(selectedIndex);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          QuranResources.englishQuranList[selectedIndex],
          style: AppStyles.bold20Primary,
        ),
        actions: [
          IconButton(
            icon: Icon(isContainerView ? Icons.list : Icons.view_agenda),
            onPressed: () {
              setState(() {
                isContainerView = !isContainerView;
              });
            },
          ),
        ],
      ),
      body: Container(
        color: AppColors.blackbgColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppAssets.leftCorner),
                  Text(
                    QuranResources.arabicQuranList[selectedIndex],
                    style: AppStyles.bold24Primary,
                  ),
                  Image.asset(AppAssets.rightCorner),
                ],
              ),
              SizedBox(height: height * 0.02),
              isContainerView
                  ? Expanded(
                      child: verses.isEmpty
                          ? Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              ),
                            )
                          : ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(height: height * 0.02);
                              },
                              itemBuilder: (context, index) {
                                return SuraContentItem(
                                  suraContent: verses[index],
                                  index: index,
                                  isSelected: selectedAyahIndex == index,
                                  onContainerClick: () {
                                    setState(() {
                                      selectedAyahIndex = index;
                                    });
                                  },
                                );
                              },
                              itemCount: verses.length,
                            ),
                    )
                  : Expanded(
                      child: verses.isEmpty
                          ? Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              ),
                            )
                          : SingleChildScrollView(
                              child: SuraContentItem2(suraContent: suraContent),
                            ),
                    ),

              Image.asset(AppAssets.bottomMosqueBg),
            ],
          ),
        ),
      ),
    );
  }

  void loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/quran/${index + 1}.txt',
    );
    List<String> lines = fileContent.split('\n');
    verses = lines;
    Future.delayed(Duration(seconds: 1), () => setState(() {}));
  }

  void loadSuraFileString(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/quran/${index + 1}.txt',
    );
    List<String> lines = fileContent.split('\n');
    for (int i = 0; i < lines.length; i++) {
      lines[i] += '[${i + 1}] ';
    }
    suraContent = lines.join();
    Future.delayed(Duration(seconds: 1), () => setState(() {}));
  }
}

/*
          Expanded(child:  verses.isEmpty ?
          Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          )
              :
          ListView.builder(
            itemBuilder: (context , index){
              return Text(verses[index]);
            },
            itemCount: verses.length,
          ),)

 */
