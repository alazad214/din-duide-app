import 'package:din_guide_app/features/authentication/presentation/password_change_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../common_widgets/auth_appbar.dart';
import '../../../common_widgets/custom_button.dart';
import '../../../common_widgets/custom_textfeild.dart';
import '../../../helpers/ui_helpers.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
       const     AuthCustomAppBar(title: 'Reset Password'),
            UIHelper.verticalSpace(32.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    const  Text(
                        'Password *',
                        style: TextStyle(
                          color: const Color(0xFF333333),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                     const SizedBox(height: 10),
                    const  CustomTextfield(hintText: 'Enter your password'),
                     const SizedBox(height: 20),
                     const Text(
                        'Confirm Password *',
                        style: TextStyle(
                          color:  Color(0xFF333333),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    const  SizedBox(height: 10),
                   const   CustomTextfield(hintText: 'Enter Confirm Password'),

                   const   SizedBox(height: 32),

                      //Forget Button-->
                      customButton(
                        name: 'Save & Continue',
                        onCallBack: () {
                          Get.to(() =>const PasswordChangeSuccessScreen());
                        },
                        context: context,
                      ),
                  const    SizedBox(height: 20),
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
