
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constants/app_assets/assets_icons.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/text_font_style.dart';
import '../../bottom_nav/presentation/navigation_screen.dart';


class OnboardingButton extends StatelessWidget {
  final VoidCallback onTap;
  const OnboardingButton({
    super.key, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(35.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
             Get.to(()=> NavigationScreen());
            },
            child: Text(
              'Skip',
              style: TextFontStyle.headline16w600c333333
              
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.r),
                color: AppColors.primaryColor   
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(AssetsIcons.arrorRight)
              ),
            ),
          )
        ],
      ),
    );
  }
}
