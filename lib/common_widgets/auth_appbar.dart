import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../constants/app_assets/assets_image.dart';
import '../constants/app_colors.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    this.onCallBack,
    this.leadingVisible = false,
    this.actions,
    this.centerTitle,
    this.backgroundColor,
  });

  final String title;
  final onCallBack;
  final bool leadingVisible;
  final actions;
  final centerTitle;
  final backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsImage.bg3),
            fit: BoxFit.cover,
          ),
        ),
      ),
      leading: Visibility(
        visible: !leadingVisible,
        child: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.cFFFFFF,
            size: 20.sp,
          ),
        ),
      ),
      backgroundColor: backgroundColor ?? Colors.transparent,
      titleSpacing: 2.w,
      centerTitle: centerTitle ?? true,
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.cFFFFFF,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
