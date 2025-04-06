import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_assets/assets_image.dart';
import '../../../constants/app_assets/networks_image.dart';
import '../../../constants/app_colors.dart';
import '../../../helpers/navigation_service.dart';

class DuaDetailsScreen extends StatefulWidget {
  const DuaDetailsScreen({super.key});

  @override
  State<DuaDetailsScreen> createState() => _DuaDetailsScreenState();
}

class _DuaDetailsScreenState extends State<DuaDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Get.height / 8,

              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetsImage.bg2),
                  fit: BoxFit.cover,
                ),
                borderRadius:const BorderRadius.only(
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
                        icon: const Icon(Icons.arrow_back, color: AppColors.cWhite),
                      ),

                    const  Text(
                        'Dua MP3',
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
              padding:const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: Get.width,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.network(
                      NetworksImage.sliderImage,
                      fit: BoxFit.cover,
                    ),
                  ),

                 const SizedBox(height: 50),
                  Row(
                    children: [
                    const  Text(
                        "4:00",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.c000000,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      Expanded(
                        child: Slider(
                          activeColor: AppColors.primaryColor,
                          value: 0.5,
                          onChanged: (value) {},
                        ),
                      ),
                    const  Text(
                        "3:40",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.c000000,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon:const Icon(
                          Icons.skip_previous,
                          size: 50,
                          color: Colors.black54,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon:const Icon(
                          Icons.pause,
                          size: 50,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon:const Icon(
                          Icons.skip_next,
                          size: 50,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
               const   SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
