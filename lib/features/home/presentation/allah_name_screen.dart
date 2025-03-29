
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_assets/assets_image.dart';
import '../../../constants/app_colors.dart';
import '../../../helpers/navigation_service.dart';
import '../widgets/allah_mane_list.dart';

class AllahNameScreen extends StatelessWidget {
  const AllahNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Get.height / 8,
              width: Get.width / 1,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetsImage.bg2),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          NavigationService.goBack;
                        },
                        icon:const Icon(Icons.arrow_back, color: AppColors.cWhite),
                      ),

                     const Text(
                        '99 Name of Allah',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    itemCount: allahNames.length,
                    shrinkWrap: true,
                    physics:const NeverScrollableScrollPhysics(),
                    padding:const EdgeInsets.all(0),
                    itemBuilder: (_, index) {
                      final data = allahNames[index];
                      return Container(
                        margin:const EdgeInsets.only(bottom: 12),
                        padding:const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text('${index + 1}'),
                          ),
                          title: Text(
                            "${data['transliteration']}",
                            style:const TextStyle(
                              color: AppColors.cWhite,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          trailing: Text(
                            "${data['arabic']}",
                            style:const TextStyle(
                              color: AppColors.cWhite,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                const  SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
