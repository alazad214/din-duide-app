
import 'package:flutter/material.dart';
import '../../../common_widgets/custom_button.dart';
import '../../../common_widgets/custom_textfeild.dart';
import '../../../constants/app_assets/assets_image.dart';
import '../../../constants/text_font_style.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextFontStyle.textStyle18w700c333333,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(AssetsImage.avatar),
                radius: 55,
              ),
            const  SizedBox(height: 10),
             const Text(
                "Abk Azad",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),

             const Text(
                "abkazad@gmail.com",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),

             const SizedBox(height: 20),

             const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Full name ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 5),
                  CustomTextfield(
                    hintText: 'Enter your name',
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 12,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Email",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 5),
                  CustomTextfield(
                    hintText: 'Enter your Email',
                    isRead: true,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 12,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            const  SizedBox(height: 30),
              customButton(
                name: 'Save',
                onCallBack: () {},
                context: context,
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
