import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_assets/assets_icons.dart';
import '../../../constants/app_assets/assets_image.dart';
import '../../notification/notification_screen.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 114,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 6,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: NetworkImage(AssetsImage.avatar),
                        fit: BoxFit.cover,
                      ),
                      shape:const OvalBorder(),
                    ),
                  ),
                const  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 2,
                    children: [
                      Text(
                        'Hey Albert!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,

                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'London',
                        style: TextStyle(
                          color:  Color(0xFFE8E8E8),

                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              InkWell(
                onTap: (){
                  Get.to(()=>const NotificationScreen());
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration:const BoxDecoration(
                    color: Colors.white24,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(AssetsIcons.notification),
                ),
              ),
            ],
          ),
        ),
      const  Text(
          'As-salamu alaykum',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        StreamBuilder(
          stream: Stream.periodic(const Duration(seconds: 1)),
          builder: (context, snapshot) {
            return Text(
              TimeOfDay.now().format(context),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            );
          },
        ),
      ],
    );
  }
}
