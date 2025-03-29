import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_widgets/custom_button.dart';
import '../../../common_widgets/custom_textfeild.dart';
import '../../../constants/app_assets/assets_image.dart';
import '../../../constants/app_colors.dart';
import '../../bottom_nav/presentation/navigation_screen.dart';
import 'login_screen.dart' show LoginScreen;

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isRemember = false;
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
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Sign up to your account',
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
               const   Text(
                    'Full Name * ',
                    style: TextStyle(
                      color:  Color(0xFF333333),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
               const   SizedBox(height: 10),
               const   CustomTextfield(hintText: 'Enter your name'),
               const   SizedBox(height: 20),
                const  Text(
                    'Email Address * ',
                    style: TextStyle(
                      color:  Color(0xFF333333),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                const  SizedBox(height: 10),
                const  CustomTextfield(hintText: 'Enter your email'),
               const   SizedBox(height: 20),
                const  Text(
                    'Password *',
                    style: TextStyle(
                      color:  Color(0xFF333333),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
               const   SizedBox(height: 10),
               const   CustomTextfield(hintText: 'Enter your password'),
               const   SizedBox(height: 20),
              const    Text(
                    'Confirm Password *',
                    style: TextStyle(
                      color:  Color(0xFF333333),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                const  SizedBox(height: 10),
                const  CustomTextfield(hintText: 'Enter your confirm password'),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      buildSqureCheckbox(),
                  const    Text(
                        'By Signing up, you agree to the terms and conditions.',
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          color: Color(0xFFA1A1A1),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),

                const  SizedBox(height: 20),

                  //Sign-Up Button-->
                  customButton(
                    name: 'Sign Up',
                    onCallBack: () {
                      Get.offAll(() => NavigationScreen());
                    },
                    context: context,
                  ),
                 const SizedBox(height: 20),

                  //Login Here-->
                  Align(
                    alignment: Alignment.center,
                    child: Text.rich(
                      TextSpan(
                        children: [
                       const   TextSpan(
                            text: 'Already have an account? ',
                            style: TextStyle(
                              color:  Color(0xFFC0C0C0),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                     const     TextSpan(
                            text: ' ',
                            style: TextStyle(
                              color:  Color(0xFFC0C0C0),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 1.64,
                            ),
                          ),
                          TextSpan(
                            text: 'Sign In',
                            style:const TextStyle(
                              color:  Color(0xFF59AECE),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    log('tap');
                                    Get.to(() =>const LoginScreen());
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

  Checkbox buildSqureCheckbox() {
    return Checkbox(
      value: isRemember,
      fillColor:
          isRemember
              ? WidgetStateProperty.all(AppColors.primaryColor)
              : WidgetStateProperty.all(AppColors.cWhite),
      checkColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      side:
          isRemember
              ? const BorderSide(color: Colors.transparent, width: 1)
              : const BorderSide(color: AppColors.primaryColor, width: 1),
      onChanged: (value) {
        setState(() {
          isRemember = value ?? false;
        });
      },
    );
  }
}
