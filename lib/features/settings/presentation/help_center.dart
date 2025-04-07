import 'package:flutter/material.dart';

import '../../../common_widgets/auth_appbar.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Help Center'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome to Din Guide Help Center',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            const Text(
              'How can we assist you today?',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            HelpTile(
              icon: Icons.info_outline,
              title: 'About Din Guide',
              subtitle: 'Learn more about the app and features.',
              onTap: () {},
            ),
            HelpTile(
              icon: Icons.bug_report_outlined,
              title: 'Report a Problem',
              subtitle: 'Found a bug or issue? Let us know.',
              onTap: () {},
            ),
            HelpTile(
              icon: Icons.email_outlined,
              title: 'Contact Support',
              subtitle: 'Email us at support@dingude.com',
              onTap: () {},
            ),
            HelpTile(
              icon: Icons.privacy_tip_outlined,
              title: 'Privacy Policy',
              subtitle: 'Read how we protect your data.',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class HelpTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const HelpTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: const TextStyle()),
      subtitle: Text(subtitle, style: const TextStyle()),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
