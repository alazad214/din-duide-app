import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/app_colors.dart';

class onBoardingTopSection extends StatelessWidget {
  final String imageUrl;
  const onBoardingTopSection({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 390.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12.r),
          bottomRight: Radius.circular(12.r),
        ),
        color: AppColors.primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 101,
          bottom: 51,
          right: 46,
          left: 46,
        ),
        child: Image.asset(imageUrl),
      ),
    );
  }
}
