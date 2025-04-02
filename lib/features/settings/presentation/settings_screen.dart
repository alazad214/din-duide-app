import 'package:flutter/material.dart';
import '../../../common_widgets/auth_button.dart';
import '../../../constants/app_assets/assets_icons.dart';
import '../../../constants/app_assets/networks_image.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/text_font_style.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile', style: TextFontStyle.headline20w700c0CC0DF),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(NetworksImage.avatar),
                radius: 55,
              ),
            const SizedBox(height: 10),
             const Text(
                "Abk Azad",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),

            const  Text(
                "abkazad@gmail.com",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
           

            const  SizedBox(height: 20),

              buildProfileTile(
                image: AssetsIcons.profile,
                title: 'Personal Info',
                ontap: () {
                    
                },
              ),
              buildProfileTile(
                image: AssetsIcons.lock,
                title: 'Change Password',
                ontap: () {},
              ),
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

              SizedBox(height: 50),

              authButton(
                name: 'Logout',
                onCallBack: () {
              
                },
                context: context,
                image: AssetsIcons.logout,
              ),
            ],
          ),
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
