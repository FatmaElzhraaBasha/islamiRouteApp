import 'package:flutter/material.dart';
import 'package:islami_route_app/tabs/radio_tab/radio_resources.dart';
import 'package:islami_route_app/tabs/radio_tab/radio_tab_details.dart';
import 'package:islami_route_app/utils/app_colors.dart';
import 'package:islami_route_app/utils/app_styles.dart';

class RadioTab extends StatelessWidget {
  RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              bottom: height * 0.02,
              right: width * 0.046,
              left: width * 0.046,
            ),
            decoration: BoxDecoration(
              color: AppColors.blackColor.withAlpha(178),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TabBar(
              tabs: [
                Tab(child: Text('Radio', style: AppStyles.bold16)),
                Tab(child: Text('Reciters', style: AppStyles.bold16)),
              ],
              indicatorPadding: EdgeInsets.symmetric(vertical: height * 0.003),
              dividerColor: AppColors.transparentColor,
              labelColor: AppColors.blackColor,
              unselectedLabelColor: AppColors.whiteColor,
              indicator: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
          // Tab Content
          Expanded(
            child: TabBarView(
              children: [
                RadioTabDetails(list: RadioResources.radioList),
                RadioTabDetails(list: RadioResources.recitersList),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
