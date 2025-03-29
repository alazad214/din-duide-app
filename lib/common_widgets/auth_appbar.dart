import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_assets/assets_icons.dart';
import '../constants/app_colors.dart';
import '../helpers/navigation_service.dart';
import '../helpers/ui_helpers.dart';

class AuthCustomAppBar extends StatelessWidget {
  final String title;
  final bool? isLeading;
  const AuthCustomAppBar({
    super.key,
    required this.title,
    this.isLeading = true,
  });

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
        padding: const EdgeInsets.only(
          top: 59,
          bottom: 59,
          right: 24,
          left: 24,
        ),
        child: Row(
          children: [
            isLeading == true
                ? GestureDetector(
                  onTap: () => NavigationService.goBack,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 5.h,
                    ),
                    child: Image.asset(AssetsIcons.arrorBack),
                  ),
                )
                : const SizedBox.shrink(),
            UIHelper.horizontalSpace(12.w),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,

                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
