import 'package:din_guide_app/constants/text_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget categoryCard(BuildContext context, {image, title, index, ontap}) {
  return InkWell(
    onTap: ontap ?? () {},
    child: Container(
      width: MediaQuery.sizeOf(context).width / 3.7,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        children: [
          Container(
            height: 70.h,
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8),
                topLeft: Radius.circular(8),
              ),
              color: Colors.accents[index % Colors.primaries.length].shade100,
            ),
            child: Image.asset(image, height: 30.h),
          ),
          const SizedBox(height: 8),
          Text(
            overflow: TextOverflow.ellipsis,
            title,
            style: TextFontStyle.textStyle12w600c000000,
          ),
        ],
      ),
    ),
  );
}
