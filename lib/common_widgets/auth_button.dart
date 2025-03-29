import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';
import '../constants/text_font_style.dart';

Widget authButton({
  required String name,
  required VoidCallback onCallBack,
  image,
  double? height,
  double? minWidth,
  double? borderRadius,
  Color? color,
  padding,
  TextStyle? textStyle,
  required BuildContext context,
  Color? borderColor,
  elevation,
}) {
  return GestureDetector(
    onTap: onCallBack,
    child: Container(
      height: height ?? 48.h,
      width: minWidth ?? double.infinity,
      padding: padding ?? EdgeInsets.all(0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color ?? AppColors.primaryColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
        border: Border.all(color: borderColor ?? AppColors.primaryColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            overflow: TextOverflow.ellipsis,
            style:
                textStyle ??
                TextFontStyle.textStyle16w600cFFFFFF.copyWith(
                  color: AppColors.cWhite,
                ),
          ),
          SizedBox(width: 10.w),
          if (image != null) Image.asset(image, height: 20),
        ],
      ),
    ),
  );
}
