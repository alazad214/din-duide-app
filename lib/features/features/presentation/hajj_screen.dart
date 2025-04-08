import 'package:flutter/material.dart';

import '../../../common_widgets/auth_appbar.dart';

class HajjScreen extends StatelessWidget {
  const HajjScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'হজ সম্পর্কিত তথ্য',
        leadingVisible: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildCard(
            'হজ কি?',
            Icons.info_outline,
            'হজ হলো ইসলামের পাঁচটি স্তম্ভের একটি গুরুত্বপূর্ণ ফরজ ইবাদত। এটি প্রতি বছর মক্কায় অনুষ্ঠিত হয় এবং মুসলমানদের জন্য একটি বিশেষ ধর্মীয় কর্তব্য।',
          ),
          buildCard(
            'হজের ফরজ শর্ত',
            Icons.check_circle,
            'হজ পালনের জন্য কিছু শর্ত পূর্ণ করতে হয়, যেমন: মুসলমান হওয়া, বালেগ হওয়া, অর্থনৈতিকভাবে সক্ষম হওয়া, এবং মহিলাদের সাথে মাহরাম থাকা।',
          ),
          buildCard(
            'হজের শর্তাদি',
            Icons.list_alt,
            'হজ করার জন্য মুসলমানের কাছে একাধিকার কিছু শর্ত থাকতে হবে, যেমন: শরীরিকভাবে সুস্থ থাকা, পরিপূর্ণ ইচ্ছা থাকা, এবং ইসলামের মৌলিক শর্ত পূর্ণ করা।',
          ),
          buildCard(
            'হজের স্তর',
            Icons.stars,
            'হজের স্তর: হজে মোট ৫টি স্তর রয়েছে—১. ইহরাম, ২. তাওয়াফ, ৩. সাফা-মারওয়া, ৪. ক্বুরবান, ৫. রামি।',
          ),
          buildCard(
            'হজের উদ্দেশ্য',
            Icons.mosque,
            'হজের উদ্দেশ্য হলো আল্লাহর সন্তুষ্টি অর্জন এবং জীবনের পাপ থেকে মুক্তি পাওয়া। এটি মুসলমানদের একত্রিত হওয়া এবং একে অপরের প্রতি সহানুভূতি বৃদ্ধি করে।',
          ),
          buildCard(
            'হজের ইতিহাস',
            Icons.history,
            'হজ ইসলামের ইতিহাসে অত্যন্ত গুরুত্বপূর্ণ স্থান ধারণ করে। এটি শুরু হয়েছিল প্রাক-ইসলামী যুগে এবং ইসলামিক যুগে এটি ফরজ করা হয়।',
          ),
          buildCard(
            'হজের উপকারিতা',
            Icons.health_and_safety,
            'হজ ইসলামে আত্মপবিত্রতার একটি উপায় এবং পাপ মাফ পাওয়ার একটি মাধ্যম। এটি মুসলিমদের মধ্যে একতা এবং সংহতি বৃদ্ধি করে।',
          ),
          buildCard(
            'হজের প্রস্তুতি',
            Icons.access_time,
            'হজে যাওয়ার আগে প্রস্তুতি নিতে হয়, যেমন: হজের নিয়ম শিখে নেওয়া, স্বাস্থ্য পরীক্ষা করা, ভিসা এবং টিকেট নিশ্চিত করা।',
          ),
          buildCard(
            'হজের দুআ এবং রীতিনীতী',
            Icons.library_books,
            'হজের প্রতিটি রীতিতে কিছু বিশেষ দুআ রয়েছে যা মাকবুল হতে পারে, যেমন: ইহরাম বেঁধে নেওয়ার সময় “لبیک اللهم لبیک” (লাব্বাইক আল্লাহুম্মা লাব্বীক)।',
          ),
          buildCard(
            'হজের যোগ্যতা',
            Icons.group,
            'হজের জন্য কিছু যোগ্যতা থাকতে হয়, যেমন: হজে যাওয়ার আগে সঠিক বয়স, শারীরিকভাবে সুস্থ হওয়া এবং অর্থনৈতিকভাবে সক্ষম হওয়া।',
          ),
          buildCard(
            'হজের তারিখ এবং সময়',
            Icons.calendar_today,
            'হজ ১২ জিলহজ থেকে শুরু হয়, এবং এর প্রতিটি দিন বিভিন্ন গুরুত্বপূর্ণ রীতির সাথে সম্পর্কিত। ৮ জিলহজ ইহরাম বাঁধা হয়, ৯ জিলহজ আরাফাতের দিন, ১০ জিলহজ কুরবানি করা হয়।',
          ),
          buildCard(
            'হজের খরচ এবং বাজেটিং',
            Icons.monetization_on,
            'হজের খরচ সাধারণত ভিসা, টিকেট, হোটেল, এবং অন্যান্য রীতির জন্য থাকে। এটি সাধারনত উচ্চ খরচের হতে পারে, তবে কিছু বেসরকারি উদ্যোগ বা প্রতিষ্ঠান সহায়তা প্রদান করে।',
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
                Icon(icon, size: 30, color: Colors.blue[800]),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
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
