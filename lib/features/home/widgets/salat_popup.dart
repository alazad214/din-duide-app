import 'package:flutter/material.dart';

void showSalatPopup(BuildContext context, String title, image, String content) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        content: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(radius: 60, child: Image.asset(image)),
                SizedBox(height: 20),
                Text(
                  "$title",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 20),
                Text(
                  "October 07, 2025",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 20),
                Text(
                  "05 : 38 - 6:00",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
