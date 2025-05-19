import 'package:flutter/material.dart';

Future<dynamic> customButtomSheet(
  BuildContext context, {
  ontap,
  title,
  subtitle,
}) {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder:
        (context) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Container(
                width: 100,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title ?? 'Clear Conversation Memory?',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                textAlign: TextAlign.center,
                subtitle ?? 'Are you sure you want to clear recent memory?',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.grey),
                        padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: ontap,

                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          const Color(0xFF077A7D),
                        ),
                        padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                      child: const Text(
                        'Yes',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
  );
}
