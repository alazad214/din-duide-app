
import 'package:din_guide_app/features/authentication/presentation/signup_screen.dart';
import 'package:din_guide_app/features/bottom_nav/presentation/navigation_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_widgets/custom_button.dart';
import '../../../common_widgets/custom_textfeild.dart' show CustomTextfield;
import '../../../constants/app_assets/assets_image.dart';
import '../../../constants/app_colors.dart';
import 'forget_password.dart' show ForgetPasswordScreen;

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Get.height / 3,
              width: Get.width / 1,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetsImage.bg),
                  fit: BoxFit.cover,
                ),
                borderRadius:const BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),

              child:const Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Logo',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 64,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        height: 1.50,
                      ),
                    ),
                    Text(
                      'Log in',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const Text(
                    'Email Address * ',
                    style: TextStyle(
                      color:  Color(0xFF333333),
                      fontSize: 16,

                      fontWeight: FontWeight.w500,
                    ),
                  ),
                const  SizedBox(height: 10),
                const  CustomTextfield(hintText: 'Enter your email'),
                const  SizedBox(height: 20),
                const  Text(
                    'Email Address * ',
                    style: TextStyle(
                      color:  Color(0xFF333333),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                const  SizedBox(height: 10),
                const  CustomTextfield(hintText: 'Enter your password'),

                  //Forget Password-->
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Get.to(() =>const ForgetPasswordScreen());
                      },
                      child:const Text(
                        'Forget Password?',
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    ),
                  ),

                  //Login Button-->
                  customButton(
                    name: 'Log In',
                    onCallBack: () {
                      Get.offAll(() => NavigationScreen());
                    },
                    context: context,
                  ),
                  const SizedBox(height: 20),

                  //Registration Here-->
                  Align(
                    alignment: Alignment.center,
                    child: Text.rich(
                      TextSpan(
                        children: [
                      const    TextSpan(
                            text: 'Don’t have an account?',
                            style: TextStyle(
                              color:  Color(0xFFC0C0C0),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                       const   TextSpan(
                            text: ' ',
                            style: TextStyle(
                              color:  Color(0xFFC0C0C0),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 1.64,
                            ),
                          ),
                          TextSpan(
                            text: 'Registration',
                            style:const TextStyle(
                              color:  Color(0xFF59AECE),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.to(() =>const SignupScreen());
                                  },
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
