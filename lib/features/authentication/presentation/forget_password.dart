import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common_widgets/auth_appbar.dart';
import '../../../common_widgets/custom_button.dart';
import '../../../common_widgets/custom_textfeild.dart';
import '../../../helpers/ui_helpers.dart';
import 'otp_verify_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AuthCustomAppBar(title: 'Forget password'),
            UIHelper.verticalSpace(32.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email address *',
                        style: TextStyle(
                          color: const Color(0xFF333333),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomTextfield(hintText: 'g***3793@gmail.com'),

                      SizedBox(height: 32),

                      //Forget Button-->
                      customButton(
                        name: 'Send',
                        onCallBack: () {
                           Get.to(()=>OtpVerifyScreen());
                        },
                        context: context,
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
