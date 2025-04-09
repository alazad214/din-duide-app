import 'package:flutter/material.dart';

class QurbaniInfoScreen extends StatelessWidget {
  const QurbaniInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('কুরবানি সম্পর্কে'),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitle('🕌 কুরবানির পরিচিতি'),
            buildContentSection(
              'কুরবানি হলো ইসলামের একটি গুরুত্বপূর্ণ ইবাদত যা ঈদুল আযহার সময় আদায় করা হয়। এটি হযরত ইব্রাহিম (আঃ) এর ত্যাগ ও আল্লাহর প্রতি আনুগত্যের নিদর্শন।',
            ),

            buildTitle('📅 কুরবানির সময়'),
            buildContentSection(
              'কুরবানির সময় শুরু হয় ঈদুল আযহার নামাজের পর থেকে এবং তা চলতে থাকে ৩ দিন পর্যন্ত (১০ই জিলহজ থেকে ১২ই জিলহজ)।',
            ),

            buildTitle('🐄 কুরবানির পশু'),
            buildContentSection(
              'কুরবানির জন্য গরু, ছাগল, ভেড়া, উট ইত্যাদি হালাল পশু ব্যবহার করা হয়। পশুটি হতে হবে স্বাস্থ্যবান ও নির্দোষ।',
            ),

            buildTitle('👤 কে কে কুরবানি করতে পারবে?'),
            buildContentSection(
              'যে ব্যক্তি প্রাপ্তবয়স্ক, মুকিম (বাসিন্দা), এবং যার উপর নেসাব পরিমাণ সম্পদ রয়েছে (জাকাত ফরজ হতো এমন সম্পদ), তার জন্য কুরবানি করা ওয়াজিব।',
            ),

            buildTitle('🍖 কুরবানির গোশতের বণ্টন'),
            buildContentSection(
              'কুরবানির গোশত তিন ভাগ করা উত্তম: একটি অংশ নিজের জন্য, একটি আত্মীয়স্বজনের জন্য এবং একটি গরীবদের জন্য।',
            ),

            buildTitle('🎯 কুরবানি করার উদ্দেশ্য'),
            buildContentSection(
              'কুরবানি শুধু একটি ধর্মীয় কর্মকাণ্ড নয়, এটি একজন মুসলমানের আল্লাহর প্রতি আনুগত্য এবং ত্যাগের নিদর্শন। এর মাধ্যমে আমরা আল্লাহর প্রতি আমাদের কৃতজ্ঞতা এবং ভালবাসা প্রকাশ করি।',
            ),

            buildTitle('📜 কুরবানি ইতিহাস'),
            buildContentSection(
              'কুরবানি ইসলামের ইতিহাসের একটি গুরুত্বপূর্ণ অংশ। এটি হযরত ইব্রাহিম (আঃ) এর কুরবানির ঘটনা থেকে উদ্ভূত। আল্লাহর নির্দেশে হযরত ইব্রাহিম (আঃ) তার পুত্র হযরত ইসমাইল (আঃ) কে কুরবানি দেওয়ার জন্য প্রস্তুত ছিলেন। কিন্তু আল্লাহ তাদের পরীক্ষা নিয়ে সেই পশুকে বদলে একটি উট পাঠিয়েছিলেন।',
            ),

            buildTitle('🌟 কুরবানির উপকারিতা'),
            buildContentSection(
              'কুরবানি আমাদের আত্মিক পরিশুদ্ধি, মানবিক মূল্যবোধ এবং সমাজে গরীবদের সাহায্য করার একটি উপায়। এছাড়া এটি মুসলমানদের মধ্যে সংহতি ও একতা প্রতিষ্ঠা করে।',
            ),

            buildTitle('💡 বিশেষ দিকনির্দেশনা'),
            buildContentSection(
              '• পশুকে কষ্ট না দিয়ে জবাই করা\n• বয়স ও স্বাস্থ্য নিশ্চিত হওয়া\n• নিয়ত সহিহ রাখা\n• পশুর প্রতি দয়া প্রদর্শন করা\n• গরীবদের অংশ বণ্টন নিশ্চিত করা',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.green.shade800,
        ),
      ),
    );
  }

  Widget buildContentSection(String content) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      color: Colors.green.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          content,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}
