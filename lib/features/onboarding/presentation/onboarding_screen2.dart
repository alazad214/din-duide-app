
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constants/app_assets/assets_image.dart';
import '../../../constants/text_font_style.dart';
import '../../../helpers/ui_helpers.dart';
import '../../bottom_nav/presentation/navigation_screen.dart';
import '../widgets/onboarding_button.dart';
import '../widgets/onboarding_top_section.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          onBoardingTopSection(imageUrl: AssetsImage.onboarding),
          UIHelper.verticalSpace(98.h),
          Text('Explore  Our App', style: TextFontStyle.headline32w600c333333),
          UIHelper.verticalSpace(12.h),
          Text(
            'You have successfully change password.',
            style: TextFontStyle.headline16w400c333333,
          ),
          Text(
            'Please use the new password when Sign in.',
            style: TextFontStyle.headline16w400c333333,
          ),
         const Spacer(),
          OnboardingButton(
            onTap: () {
              Get.to(() => NavigationScreen ());
            },
          ),
        ],
      ),
    );
  }
}
