import 'package:din_guide_app/core/common/utils/assets_image.dart';
import 'package:din_guide_app/core/common/styles/app_colors.dart';
import 'package:din_guide_app/core/helpers/app_version.dart';
import 'package:din_guide_app/core/networks/endpoints.dart';
import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final versionInfo = AppVersionInfo();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(color: AppColors.primaryColor),
            child: Image.asset(AssetsImage.logoPng),
          ),

          const SizedBox(height: 20),
          customTile(
            icon: Iconsax.home,
            text: 'Home',
            ontap: () {
              Navigator.pop(context);
            },
          ),

          customTile(
            icon: Icons.privacy_tip_outlined,
            text: 'Privacy Policy',
            ontap: () {
              EasyLauncher.url(url: privacyPolicy);
            },
          ),
          customTile(
            icon: Iconsax.setting,
            text: 'Contact Support',
            ontap: () {
              EasyLauncher.email(email: 'alazad214@gmail.com');
            },
          ),

          const Divider(color: Colors.black54, thickness: 0.5),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Version: ${versionInfo.version}',
              style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  ListTile customTile({icon, text, ontap}) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryColor),
      title: Text(
        text,
        style: const TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),

      onTap: ontap,
    );
  }
}
