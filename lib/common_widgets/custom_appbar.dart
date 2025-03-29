import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';
import '../constants/text_font_style.dart';

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

      backgroundColor: backgroundColor ?? Colors.transparent,
      titleSpacing: 2.w,
      centerTitle: centerTitle ?? true,
      title: Text(
        title,
        style: TextFontStyle.textStyle16w500c00BFA6.copyWith(
          color: AppColors.c000000,
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
