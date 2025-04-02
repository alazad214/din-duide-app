import 'package:din_guide_app/constants/app_assets/assets_image.dart';
import 'package:din_guide_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import '../../../constants/app_assets/assets_icons.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/text_font_style.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: TextFontStyle.headline20w700c0CC0DF),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Image.asset(AssetsImage.logoPng, height: 200),

            buildProfileTile(
              image: AssetsIcons.help,
              title: 'Help Center',
              ontap: () {},
            ),
            buildProfileTile(
              image: AssetsIcons.privacy,
              title: 'Privacy policy',
              ontap: () {},
            ),
            buildProfileTile(
              image: AssetsIcons.privacy,
              title: 'Website',
              ontap: () {},
            ),
            buildProfileTile(
              image: AssetsIcons.privacy,
              title: 'Facebook',
              ontap: () {},
            ),
            buildProfileTile(
              image: AssetsIcons.privacy,
              title: 'App Version',
              ontap: () {},
            ),
            buildProfileTile(
              image: AssetsIcons.privacy,
              title: 'Theme Change',
              ontap: () {},
            ),
            buildProfileTile(
              image: AssetsIcons.privacy,
              title: 'Share App',
              ontap: () {},
            ),
            buildProfileTile(
              image: AssetsIcons.privacy,
              title: 'Feedback',
              ontap: () {},
            ),
            UIHelper.heightLarge,
          ],
        ),
      ),
    );
  }

  Widget buildProfileTile({required image, required title, ontap}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 60,
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: Image.asset(
            image,
            height: 30,
            color: AppColors.primaryColor,
          ),
          title: Text(title, style: TextFontStyle.textStyle14w500c242424),
          trailing: Icon(Icons.arrow_forward_ios, size: 20),
        ),
      ),
    );
  }
}
