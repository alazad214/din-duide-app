import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/common/utils/assets_image.dart';
import '../../../core/common/styles/text_font_style.dart';
import '../../../core/helpers/ui_helpers.dart';
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
          OnBoardingTopSection(imageUrl: AssetsImage.onboarding2),
          Padding(
            padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
            child: Column(
              children: [
                Text(
                  'Din Guide-Your Guide',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextFontStyle.headline32w600c333333,
                ),
                UIHelper.verticalSpace(10.h),
                Text(
                  textAlign: TextAlign.center,
                  'Here, you’ll find a collection of the Quran, Hadith, and Islamic teachings. Start your journey with us today.',
                  style: TextFontStyle.headline16w400c333333,
                ),
              ],
            ),
          ),
          const Spacer(),

          OnboardingButton(
            onTap: () {
              Get.offAll(() => const NavigationScreen());
            },
          ),
        ],
      ),
    );
  }
}
