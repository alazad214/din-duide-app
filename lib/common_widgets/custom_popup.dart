import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/text_font_style.dart';
import '../helpers/ui_helpers.dart';
import 'custom_button.dart';


void customPopup(
  BuildContext context,
  String title,
  String buttonName,
  VoidCallback ontap,
) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        elevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Container(
          padding: EdgeInsets.all(20.sp),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextFontStyle.textStyle16w400c5C5C5C,
              ),
              UIHelper.widthSpace(24.h),
              Row(
                children: [
                  Expanded(
                    child: customButton(
                        name: 'Cancel',
                        onCallBack: () {
                          Navigator.pop(context);
                        },
                        height: 42.h,
                        context: context,
                        color: Colors.transparent,
                        textStyle: TextFontStyle.textStyle18w500c333333),
                  ),
                  UIHelper.widthSpace(16.w),
                  Expanded(
                    child: customButton(
                      name: buttonName,
                      height: 42.h,
                      onCallBack: ontap,
                      context: context,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
