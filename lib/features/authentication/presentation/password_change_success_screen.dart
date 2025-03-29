import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../common_widgets/auth_appbar.dart';
import '../../../common_widgets/custom_button.dart';
import '../../../constants/app_assets/assets_image.dart';
import '../../../helpers/ui_helpers.dart';
import 'otp_verify_screen.dart';

class PasswordChangeSuccessScreen extends StatelessWidget {
  const PasswordChangeSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
          const  AuthCustomAppBar(title: 'Password Changed'),
            UIHelper.verticalSpace(32.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AssetsImage.passwordChange),

                  const  SizedBox(height: 32),

                    //Forget Button-->
                    customButton(
                      name: 'Ok',
                      onCallBack: () {
                        Get.to(() =>const OtpVerifyScreen());
                      },
                      context: context,
                    ),
                const    SizedBox(height: 20),
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
