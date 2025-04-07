import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../constants/app_colors.dart';

Future<void> showAppVersionDialog(BuildContext context) async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  String appName = packageInfo.appName;
  String version = packageInfo.version;
  String buildNumber = packageInfo.buildNumber;

  if (!context.mounted) return;

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text(
          'App Info',
          style: TextStyle(
            color: AppColors.c000000,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          '$appName\nVersion: $version+$buildNumber',
          style: const TextStyle(color: AppColors.c000000, fontWeight: FontWeight.w600),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK', style: TextStyle(color: Colors.blue)),
          ),
        ],
      );
    },
  );
}
