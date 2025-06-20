import 'package:din_guide_app/core/common/widgets/app_version_popup.dart';
import 'package:din_guide_app/core/common/utils/assets_image.dart';
import 'package:din_guide_app/features/settings/presentation/help_center.dart';
import 'package:din_guide_app/core/helpers/ui_helpers.dart';
import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import '../../../core/common/widgets/auth_appbar.dart';
import '../../../core/common/utils/assets_icons.dart';
import '../../../core/common/styles/app_colors.dart';
import '../../../core/common/styles/text_font_style.dart';
import '../../../core/networks/endpoints.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Settings', leadingVisible: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Image.asset(AssetsImage.logoPng, height: 200),

            buildProfileTile(
              image: AssetsIcons.help,
              title: 'হেল্প সেন্টার',
              ontap: () {
                Get.to(() => const HelpCenterScreen());
              },
            ),
            buildProfileTile(
              image: AssetsIcons.privacy,
              title: 'প্রাইভেসি পলিসি',
              ontap: () {
                EasyLauncher.url(url: privacyPolicy);
              },
            ),
            // buildProfileTile(
            //   image: AssetsIcons.themes,
            //   title: 'Theme Change',
            //   ontap: () {},
            // ),
            // buildProfileTile(
            //   image: AssetsIcons.internet,
            //   title: 'Website',
            //   ontap: () {
            //     EasyLauncher.url(url: websiteLink);
            //   },
            // ),
            // buildProfileTile(
            //   image: AssetsIcons.facebook,
            //   title: 'Facebook',
            //   ontap: () {
            //     EasyLauncher.url(url: facebookLink);
            //   },
            // ),
            buildProfileTile(
              image: AssetsIcons.version,
              title: 'অ্যাপ ভার্সন',
              ontap: () {
                AppVersionHelper.showAppVersionDialog(context);
              },
            ),

            buildProfileTile(
              image: AssetsIcons.feedback,
              title: 'ফিডব্যাক',
              ontap: () {},
            ),
            buildProfileTile(
              image: AssetsIcons.share,
              title: 'শেয়ার অ্যাপ',
              ontap: () {
                Share.share(
                  'Check out Din Guide – A beautiful Islamic app 🌙\n',
                );
              },
            ),

            UIHelper.verticalSpace(12),
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
        margin: const EdgeInsets.only(bottom: 12),
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
          trailing: const Icon(Icons.arrow_forward_ios, size: 20),
        ),
      ),
    );
  }
}
