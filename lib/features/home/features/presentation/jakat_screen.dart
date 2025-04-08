import 'package:din_guide_app/common_widgets/auth_appbar.dart';
import 'package:flutter/material.dart';

class ZakatScreen extends StatelessWidget {
  const ZakatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'জাকাত সম্পর্কিত তথ্য', leadingVisible: true,),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildCard(
            'জাকাত কি?',
            Icons.info_outline,
            'জাকাত ইসলামিক একটি ফরজ দান, যা ধনী ব্যক্তিরা গরীবদের সাহায্য করার জন্য তাদের সম্পদের নির্দিষ্ট অংশ প্রদান করেন। এটি ইসলামের পাঁচটি স্তম্ভের মধ্যে একটি।',
          ),
          buildCard(
            'জাকাতের হার',
            Icons.attach_money,
            'জাকাত সাধারণত ২.৫% (১/৪০) পরিমাণে দিতে হয়। অর্থাৎ, যদি আপনার কাছে ২.৫% পরিমাণ সম্পদ থাকে, তবে আপনাকে তা গরীবদের দিতে হবে।',
          ),
          buildCard(
            'নিসাব',
            Icons.balance,
            'নিসাব হলো সেই পরিমাণ সম্পদ যা একটি মুসলমানের কাছে থাকতে হবে, যাতে সে জাকাত দিতে বাধ্য হয়। এটি সোনা (৮০ গ্রাম) বা রূপার (৫৪০ গ্রাম) সমমূল্য সম্পদ।',
          ),
          buildCard(
            'জাকাতের উদ্দেশ্য',
            Icons.paid,
            'জাকাতের মূল উদ্দেশ্য হলো ধনী ও গরীবের মধ্যে অর্থনৈতিক সামঞ্জস্য প্রতিষ্ঠা এবং গরীবদের প্রয়োজন মেটানো। এটি সমাজে শান্তি ও সহযোগিতা তৈরি করে।',
          ),
          buildCard(
            'জাকাতের গ্রাহকরা',
            Icons.people,
            'জাকাত গ্রহণকারী গ্রাহকরা হলেন: ফকির (অভাবী), মিসকিন (অভাবী), ঋণগ্রস্ত, মুজাহিদ, যাত্রী, ইসলাম গ্রহণকারী ইত্যাদি।',
          ),
          buildCard(
            'জাকাতের সময়কাল',
            Icons.calendar_today,
            'জাকাত সাধারণত একবার প্রতি বছর দেওয়া হয়। এক বছর পর পর জাকাতের সময় আসে এবং নির্দিষ্ট তারিখে তা প্রদান করা হয়।',
          ),
          buildCard(
            'জাকাতের লাভ',
            Icons.add_box,
            'জাকাতের মাধ্যমে ব্যক্তি আত্মপবিত্রিত হন, সম্পদ বৃদ্ধি পায়, এবং সমাজে শান্তি ও সহযোগিতা প্রতিষ্ঠিত হয়।',
          ),
          buildCard(
            'জাকাতুল ফিতর',
            Icons.family_restroom,
            'জাকাতুল ফিতর হলো সেই দান যা মুসলমানদের রমজান মাসের শেষে ঈদুল ফিতরের দিন দিতে হয়। এটি গরীবদের ঈদ উৎসবে অংশগ্রহণের সুযোগ দেয়।',
          ),
          buildCard(
            'জাকাতের শর্ত',
            Icons.check_circle,
            'জাকাত দিতে হলে কয়েকটি শর্ত পূর্ণ করতে হয়, যেমন মুসলমান হওয়া, নিসাব পরিমাণ সম্পদ থাকা, এবং সম্পদ এক বছর ধরে থাকা।',
          ),
          buildCard(
            'জাকাত এবং দারিদ্র্য বিমোচন',
            Icons.help_outline,
            'জাকাত দারিদ্র্য কমাতে গুরুত্বপূর্ণ ভূমিকা রাখে। এটি গরীবদের সাহায্য করতে সহায়ক এবং সামাজিক সুরক্ষা ব্যবস্থা হিসেবে কাজ করে।',
          ),
          buildCard(
            'জাকাত দিয়ে মুক্তি',
            Icons.lock_open,
            'জাকাত দিয়ে ব্যক্তি আল্লাহর কাছে নিজের পাপ থেকে মুক্তি লাভ করেন। এটি আত্মবিশুদ্ধি এবং কল্যাণের মাধ্যম।',
          ),
        ],
      ),
    );
  }

  Widget buildCard(String title, IconData icon, String content) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 8,
      shadowColor: Colors.black.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 30, color: Colors.green[800]),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              content,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
