import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/common/styles/app_colors.dart';

class OnBoardingTopSection extends StatelessWidget {
  final String imageUrl;
  const OnBoardingTopSection({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12.r),
          bottomRight: Radius.circular(12.r),
        ),
        color: AppColors.primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: SafeArea(child: Image.asset(imageUrl, height: 250,)),
      ),
    );
  }
}
