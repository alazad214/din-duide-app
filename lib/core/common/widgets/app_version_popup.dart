import 'package:din_guide_app/core/common/widgets/custom_button.dart';
import 'package:din_guide_app/core/common/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionHelper {
  static Future<void> showAppVersionDialog(BuildContext context) async {
    if (!context.mounted) return;
    final info = await PackageInfo.fromPlatform();

    if (!context.mounted) return;
    showDialog(
      context: context,
      builder:
          (_) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 10,
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.grey.shade200,
                    child: const Icon(
                      Icons.info_outline,
                      color: AppColors.primaryColor,
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Title
                  const Text(
                    'অ্যাপ ভার্সন তথ্য',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Divider
                  Divider(color: Colors.grey.shade300),

                  // Version Info
                  _infoTile(title: 'App Name', value: info.appName),

                  _infoTile(title: 'Version', value: info.version),

                  const SizedBox(height: 16),

                  // Close Button
                  customButton(
                    name: 'বন্ধ করুন',
                    height: 42,
                    onCallBack: () {
                      Navigator.pop(context);
                    },
                    context: context,
                  ),
                ],
              ),
            ),
          ),
    );
  }

  static Widget _infoTile({required String title, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              '$title:',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(value, style: const TextStyle(color: Colors.black87)),
          ),
        ],
      ),
    );
  }
}
