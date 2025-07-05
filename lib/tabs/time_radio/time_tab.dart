import 'package:flutter/material.dart';
import 'package:islami_route_app/utils/app_assets.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.02,
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.timeTabShape),
                ),
              ),
            ),
          ),
          /* Expanded(child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
              crossAxisSpacing: width*0.04,
              mainAxisSpacing: height*0.02
              ),
              itemBuilder: (context, index) => )),*/
        ],
      ),
    );
  }
}
