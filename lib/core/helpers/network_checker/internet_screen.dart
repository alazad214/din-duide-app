import 'package:din_guide_app/core/common/widgets/custom_button.dart';
import 'package:din_guide_app/core/common/utils/assets_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../common/styles/app_colors.dart';

class NoInternetScreen extends StatelessWidget {
  final VoidCallback onRetry;

  const NoInternetScreen({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsImage.logoPng, height: 100.h),

            Icon(Icons.wifi_off, color: Colors.red, size: 60.sp),
            Text(
              'No Internet Connection Found.\nPlease check your network and try again.',
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.c000000,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),

            customButton(
              height: 45.h,
              minWidth: Get.width / 2,
              name: 'Retry',
              onCallBack: onRetry,
              context: context,
            ),
          ],
        ),
      ),
    );
  }
}
