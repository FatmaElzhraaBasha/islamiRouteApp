import 'package:flutter/material.dart';
import 'package:islami_route_app/utils/app_assets.dart';
import 'package:islami_route_app/utils/app_colors.dart';
import 'package:islami_route_app/utils/app_styles.dart';

class RadioTabDetails extends StatelessWidget {
  List<Map<String, String>> list;

  RadioTabDetails({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: width * 0.046),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Container(
          height: height * 0.15,
          margin: EdgeInsets.only(bottom: height * 0.018),
          padding: EdgeInsets.symmetric(vertical: height * 0.02),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: AlignmentDirectional.bottomEnd,
              fit: BoxFit.fitWidth,
              image: AssetImage(AppAssets.radioMosque),
            ),
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Text(list[index]['name']!, style: AppStyles.bold20Black),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite, size: 28),
                  SizedBox(width: width * 0.01),
                  Icon(Icons.play_arrow_rounded, size: 44),
                  SizedBox(width: width * 0.01),
                  Icon(Icons.volume_up_rounded, size: 28),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
