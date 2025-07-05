import 'package:flutter/material.dart';
import 'package:islami_route_app/utils/app_colors.dart';
import 'package:islami_route_app/utils/app_styles.dart';

typedef onContainerClicks = void Function();

class SuraContentItem extends StatelessWidget {
  String suraContent;
  int index;
  bool isSelected;
  onContainerClicks onContainerClick;

  //Function onContainerClick;
  SuraContentItem({
    super.key,
    required this.suraContent,
    required this.index,
    required this.isSelected,
    required this.onContainerClick,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onContainerClick,
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.001,
          vertical: height * 0.02,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryColor
              : AppColors.transparentColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.primaryColor, width: 2),
        ),
        duration: Duration(milliseconds: 200),
        child: Text(
          '$suraContent[${index + 1}]',
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: isSelected ? AppStyles.bold20Black : AppStyles.bold20Primary,
        ),
      ),
    );
  }
}
