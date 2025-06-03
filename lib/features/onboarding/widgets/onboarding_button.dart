import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/common/utils/assets_icons.dart';
import '../../../core/common/styles/app_colors.dart';
import '../../../core/common/styles/text_font_style.dart';
import '../../bottom_nav/presentation/navigation_screen.dart';

class OnboardingButton extends StatelessWidget {
  final VoidCallback onTap;
  const OnboardingButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(35.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.offAll(() => const NavigationScreen());
            },
            child: Text('Skip', style: TextFontStyle.textStyle16w600cFFFFFF.copyWith(
              color: AppColors.c333333
            )),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.r),
                color: AppColors.primaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(AssetsIcons.arrorRight),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
