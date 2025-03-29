import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../common_widgets/auth_appbar.dart';
import '../../../common_widgets/custom_button.dart';
import '../../../constants/app_colors.dart';
import '../../../helpers/ui_helpers.dart';
import 'reset_password_screen.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AuthCustomAppBar(title: 'OTP Verify'),
            UIHelper.verticalSpace(32.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PinCodeTextField(
                      length: 4,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        fieldHeight: 80,
                        fieldWidth: 80,
                        activeFillColor: Colors.transparent,
                        inactiveFillColor: Colors.transparent,
                        inactiveColor: AppColors.primaryColor,
                        selectedColor: AppColors.cWhite,
                        selectedBorderWidth: 2,
                        activeColor: AppColors.cWhite,
                        selectedFillColor: Colors.transparent,
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      cursorColor: AppColors.c245741,
                      animationDuration: Duration(milliseconds: 300),
                      enableActiveFill: true,
                      hintCharacter: '-',

                      textStyle: TextStyle(
                        color: AppColors.cWhite,
                        fontSize: 24,
                      ),
                      appContext: context,
                    ),

                    Center(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Don’t receive the code yet?',
                              style: TextStyle(
                                color: const Color(0xFF5C5C5C),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 1.50,
                              ),
                            ),
                            TextSpan(
                              text: ' ',
                              style: TextStyle(
                                color: const Color(0xFF5C5C5C),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 1.64,
                              ),
                            ),
                            TextSpan(
                              text: 'Resend Code',
                              style: TextStyle(
                                color: const Color(0xFF58CDE1),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 1.50,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 24),
                    customButton(
                      name: 'Verify OTP',
                      onCallBack: () {
                        Get.to(() => ResetPasswordScreen());
                      },
                      context: context,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
