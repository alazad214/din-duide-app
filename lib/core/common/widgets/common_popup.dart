import 'package:din_guide_app/core/common/widgets/custom_button.dart';
import 'package:din_guide_app/core/common/styles/app_colors.dart';
import 'package:din_guide_app/core/common/styles/text_font_style.dart';
import 'package:flutter/material.dart';

class CommonPopup {
  static Future<void> popup(
    BuildContext context, {
    title,
    subtitle,
    icon,
    ontap,
  }) async {
    if (!context.mounted) return;

    if (!context.mounted) return;
    showDialog(
      context: context,
      builder:
          (_) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 10,
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.grey.shade200,
                    child: Icon(
                      icon ?? Icons.info_outline,
                      color: AppColors.primaryColor,
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 16),

                  Text(
                    title ?? '',
                    style: TextFontStyle.textStyle18w700c333333,
                  ),

                  Divider(color: Colors.grey.shade300),

                  Text(
                    subtitle ?? '',
                    textAlign: TextAlign.center,
                    style: TextFontStyle.textStyle14w400c333333,
                  ),

                  const SizedBox(height: 16),

                  customButton(
                    name: 'বন্ধ করুন',
                    height: 42,
                    onCallBack:
                        ontap ??
                        () {
                          Navigator.pop(context);
                        },
                    context: context,
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
