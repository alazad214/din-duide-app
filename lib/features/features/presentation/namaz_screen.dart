import 'package:flutter/material.dart';

class NamazLearningScreen extends StatelessWidget {
  const NamazLearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('নামাজ শিখা'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and Introduction
            _buildSectionTitle('🕌 নামাজের পরিচিতি'),
            _buildSectionContent(
              'নামাজ ইসলাম ধর্মের পাঁচটি স্তম্ভের মধ্যে অন্যতম একটি গুরুত্বপূর্ণ ইবাদত। প্রতিদিন পাঁচটি সময়ে নামাজ আদায় করা ওয়াজিব (ফরজ) এবং এটি আল্লাহর প্রতি আনুগত্য প্রকাশের অন্যতম মাধ্যম।',
            ),
            
            // Section 1 (Steps of Namaz)
            _buildSectionTitle('📝 নামাজের পদ্ধতি'),
            _buildSectionContent(
              'নামাজ পড়ার জন্য কিছু নির্দিষ্ট পদ্ধতি রয়েছে। সাধারণত প্রতিটি নামাজের শুরুতে "নিয়ত" (উদ্দেশ্য) এবং তারপর "তাকবির" (আল্লাহু আকবার) বলা হয়।\n\n'
              'নামাজের পদ্ধতি হলো:\n'
              '১. তাওয়াজ্জুহ (শুদ্ধ মন ও মনোযোগ)\n'
              '২. তাকবিরুল ইহরাম (নিয়ত এবং আল্লাহু আকবার বলা)\n'
              '৩. কিয়াম (প্রতিটি নামাজে দাঁড়িয়ে প্রার্থনা করা)\n'
              '৪. রুকু (শরীরকে অর্ধেক ঝুঁকে পড়া)\n'
              '৫. সেজদা (মাথা এবং পেট মাটিতে ঠেকানো)\n'
              '৬. তাশাহহুদ (স্বীকৃতি) এবং সালাম (প্রতিবাদীর জন্য প্রার্থনা)',
            ),

            // Section 2 (Different Prayers)
            _buildSectionTitle('🕌 নামাজের প্রকার'),
            _buildSectionContent(
              'নামাজের প্রকারভেদ রয়েছে, যার মধ্যে সওয়াব, ফরজ, সুন্নাত এবং নফল নামাজ অন্তর্ভুক্ত।\n\n'
              '১. ফরজ নামাজ: যেগুলি অবশ্যই পড়তে হবে (যেমন ফজর, যোহর, আসর, মাগরিব, ঈশা)।\n'
              '২. সুন্নাত নামাজ: যে নামাজগুলি রাসুলুল্লাহ (সঃ) অধিকাংশ সময় পড়েছেন (যেমন তাহাজ্জুদ)।\n'
              '৩. নফল নামাজ: অতিরিক্ত নামাজ, যেগুলি স্বেচ্ছায় পড়া যায়।',
            ),
            
            // Section 3 (Dua After Namaz)
            _buildSectionTitle('🤲 নামাজের পর দুয়া'),
            _buildSectionContent(
              'নামাজের পর কিছু বিশেষ দোয়া পড়া হয় যা আল্লাহর কাছে প্রার্থনা করার জন্য সহায়ক। "আতিহা" এবং "আস্তাগফিরুল্লাহ" কয়েকটি উদাহরণ।',
            ),

            // Section 4 (Common Mistakes in Namaz)
            _buildSectionTitle('⚠️ নামাজে সাধারণ ভুল'),
            _buildSectionContent(
              'নামাজে কিছু সাধারণ ভুল রয়েছে, যেমন:\n'
              '• রুকু বা সেজদায় সঠিকভাবে ঝুঁকে পড়া না।\n'
              '• সঠিকভাবে তাশাহহুদ পড়া না।\n'
              '• মনোযোগের অভাব বা একাগ্রতা।',
            ),

            // Section 5 (Benefits of Namaz)
            _buildSectionTitle('🌟 নামাজের উপকারিতা'),
            _buildSectionContent(
              'নামাজের মাধ্যমে মুসলিমরা আত্মিক পরিশুদ্ধি লাভ করে, দুনিয়া এবং আখিরাতে শান্তি এবং সাফল্য অর্জন করতে পারে। এটি মনকে শুদ্ধ এবং শরীরকে সুস্থ রাখে।',
            ),

            // Section 6 (Hadith about Namaz)
            _buildSectionTitle('📜 নামাজ সম্পর্কে হাদিস'),
            _buildSectionContent(
              'রাসুলুল্লাহ (সঃ) বলেছেন:\n'
              '"নামাজ, বান্দার সাথে আল্লাহর যোগাযোগের সরাসরি মাধ্যম।"\n\n'
              'আল্লাহর প্রতি আনুগত্য এবং ধার্মিকতার এক বড় উপায় হচ্ছে নামাজ।',
            ),
          ],
        ),
      ),
    );
  }

  // Section Title Widget
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.blue.shade800,
        ),
      ),
    );
  }

  // Section Content Widget
  Widget _buildSectionContent(String content) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      color: Colors.blue.shade50,
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
