import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_route_app/utils/app_assets.dart';

import '../../model/hadeth.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class HadethItem extends StatefulWidget {
  int index;

  HadethItem({super.key, required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadethFile(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.01,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryColor,
        image: DecorationImage(image: AssetImage(AppAssets.hadethCardBg)),
      ),
      child: hadeth == null
          ? Center(
              child: CircularProgressIndicator(color: AppColors.blackColor),
            )
          : Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AppAssets.hadethCornerLeft,
                      width: width * 0.15,
                    ),
                    Expanded(
                      child: Text(
                        hadeth?.title ?? "",
                        style: AppStyles.bold24Black,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Image.asset(
                      AppAssets.hadethCornerRight,
                      width: width * 0.15,
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      hadeth?.content ?? "",
                      style: AppStyles.bold16Black,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Image.asset(AppAssets.hadethMosqueBottom),
              ],
            ),
    );
  }

  void loadHadethFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/hadeth/h$index.txt',
    );
    int fileLinesIndex = fileContent.indexOf('\n');
    String title = fileContent.substring(0, fileLinesIndex);
    String content = fileContent.substring(fileLinesIndex + 1);
    hadeth = Hadeth(title: title, content: content);
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
    /*List<String> hadethLines = fileContent.split('\n');
    for(int i=0 ; i<hadethLines.length ; i++){
      String title = hadethLines[0];
      hadethLines.removeAt(0);*/
  }
}
