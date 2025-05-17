import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class CustomSteper extends StatelessWidget {
  final Color? circleColor1;
  final Color? circleColor2;
  final Color? circleColor3;
  final Color? lineColor1;
  final Color? lineColor2;
  const CustomSteper(
      {super.key,
      this.circleColor1,
      this.circleColor2,
      this.circleColor3,
      this.lineColor1,
      this.lineColor2});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor:circleColor1?? AppColors.primaryColor,
          radius: 11.r,
        ),
        Expanded(
            child: Container(
          height: 6.h,
          width: double.infinity,
          color:lineColor1?? AppColors.primaryColor,
        )),
        CircleAvatar(
          backgroundColor:circleColor2?? AppColors.primaryColor,
          radius: 11.r,
        ),
        Expanded(
            child: Container(
          height: 6.h,
          width: double.infinity,
          color: lineColor2??AppColors.primaryColor,
        )),
        CircleAvatar(
          backgroundColor:circleColor3?? AppColors.primaryColor,
          radius: 11.r,
        ),
      ],
    );
  }
}
