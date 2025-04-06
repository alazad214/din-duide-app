import 'package:din_guide_app/constants/app_assets/assets_image.dart';
import 'package:din_guide_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

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

          customTile(icon: Iconsax.settings, text: 'Settings', ontap: () {}),
          customTile(icon: Iconsax.info_circle, text: 'About Us', ontap: () {}),

          const Divider(color: Colors.black54, thickness: 0.5),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Version 1.0.0',
              style: TextStyle(
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
