import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart' show AppColors;
import '../constants/text_font_style.dart';

class CustomTextfield extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final double? fieldHeight;
  final int? maxline;
  final String? Function(String?)? validator;
  final bool? validation;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? isObsecure;
  final bool? isPass;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final bool? isEnabled;
  final double? cursorHeight;
  final Color? disableColor;
  final bool? isRead;
  final double? borderRadius;
  final Color? fillColor;
  final TextStyle? hintTextSyle;
  final Color? borderColor;
  final TextAlign? textAlign;
  final VoidCallback? ontap;
  final EdgeInsetsGeometry? contentPadding;
  final ValueChanged<String>? onSubmitted;

  //final double

  const CustomTextfield({
    super.key,
    this.hintText,
    this.labelText,
    this.controller,
    this.inputType,
    this.fieldHeight,
    this.maxline,
    this.validator,
    this.validation,
    this.suffixIcon,
    this.prefixIcon,
    this.isObsecure = false,
    this.isPass = false,
    this.focusNode,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
    this.onChanged,
    this.inputFormatters,
    this.labelStyle,
    this.isEnabled,
    this.style,
    this.cursorHeight,
    this.disableColor,
    this.isRead = false,
    this.borderRadius,
    this.fillColor,
    this.hintTextSyle,
    this.borderColor,
    this.textAlign = TextAlign.center,
    this.ontap,
    this.contentPadding,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.left,
      readOnly: isRead ?? false,
      cursorHeight: cursorHeight ?? 20,
      //cursorColor: Colors.blue,
      focusNode: focusNode,
      obscureText: isObsecure ?? false,
      onTap: ontap,
      textInputAction: textInputAction,

      validator: validator,

      maxLines: maxline ?? 1,
      controller: controller,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      enabled: isEnabled,
      obscuringCharacter: "*",
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: fillColor ?? Colors.transparent,
        filled: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        hintText: hintText,
        hintStyle:
            hintTextSyle ??
            const TextStyle(color: AppColors.c333333, fontSize: 16),

        labelText: labelText,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          borderSide: BorderSide(color: borderColor ?? Colors.blue, width: 1.5),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.cC0C0C0,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.cC0C0C0,
            width: 1,
          ),
        ),
      ),

      style:
          style ??
          TextFontStyle.textStyle16w600cFFFFFF.copyWith(
            color: AppColors.c000000,
          ),
      keyboardType: inputType,
    );
  }
}
