import 'package:din_guide_app/features/onboarding/presentation/onboarding_screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/common/utils/assets_image.dart';
import '../../../core/common/styles/text_font_style.dart';
import '../../../core/helpers/ui_helpers.dart';
import '../widgets/onboarding_button.dart' show OnboardingButton;
import '../widgets/onboarding_top_section.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          OnBoardingTopSection(imageUrl: AssetsImage.onboarding),

          Padding(
            padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
            child: Column(
              children: [
                Text(
                  'Explore  Our App',
                   overflow: TextOverflow.ellipsis,
                  style: TextFontStyle.headline32w600c333333,
                ),
                UIHelper.horizontalSpace(12.h),
                Text(
                  textAlign: TextAlign.center,
                  'Access the Quran, Hadith, and other Islamic resources in one place and make your journey easier.',
                  style: TextFontStyle.headline16w400c333333,
                ),
              ],
            ),
          ),

          const Spacer(),
          OnboardingButton(
            onTap: () {
              Get.to(() => const OnboardingScreen2());
            },
          ),
        ],
      ),
    );
  }
}
