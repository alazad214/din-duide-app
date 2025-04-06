import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final class UIHelper {
  UIHelper._();

  static final double _heightSmall = 10.w;
  static final double _heightMedium = 16.w;
  static final double _heightMediumLarge = 22.w;
  static final double _heightLarge = 22.w;

  static final double _widthSmall = 6.h;
  static final double _widthMedium = 12.h;
  static final double _widthMediumLarge = 18.h;
  static final double __horizontalSpaceLarge = 24.h;

  static Widget widthSmall = SizedBox(width: _widthSmall);
  static Widget widthMedium = SizedBox(width: _widthMedium);
  static Widget widthMediumLarge = SizedBox(width: _widthMediumLarge);
  static Widget horizontalSpaceLarge = SizedBox(width: __horizontalSpaceLarge);

  static Widget heightSmall = SizedBox(height: _heightSmall);
  static Widget heightMedium = SizedBox(height: _heightMedium);
  static Widget heightMediumLarge = SizedBox(height: _heightMediumLarge);
  static Widget heightLarge = SizedBox(height: _heightLarge);

  static Widget widthSpace(double width) => SizedBox(width: width);
  static Widget heightSpace(double height) => SizedBox(height: height);

  static double kdefaultPadding() => 20.sp;
  static double kPaddingSmall() => 10.sp;
  static double kPaddingMedium() => 16.sp;
  static double kPaddingLarge() => 24.sp;
}
