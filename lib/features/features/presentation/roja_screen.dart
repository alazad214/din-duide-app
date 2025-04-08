import 'package:din_guide_app/common_widgets/auth_appbar.dart';
import 'package:flutter/material.dart';

class RojaDetailsScreen extends StatelessWidget {
  const RojaDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'রোজা সম্পর্কে', leadingVisible: true),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          SectionTitle('🕌 রোজা (সিয়াম) কী?'),
          SectionText(
            'রোজা (সাওম) ইসলামের পাঁচটি স্তম্ভের একটি। এর অর্থ: নির্দিষ্ট সময় পর্যন্ত পানাহার, স্ত্রী সহবাস এবং সকল পাপকার্য থেকে বিরত থাকা।',
          ),

          SectionTitle('📖 কুরআনে রোজা সম্পর্কে'),
          SectionText(
            '"হে ঈমানদারগণ! তোমাদের উপর রোজা ফরজ করা হয়েছে, যেমন ফরজ করা হয়েছিল তোমাদের পূর্ববর্তীদের উপর, যাতে তোমরা তাকওয়া অর্জন করতে পার।" — সূরা আল-বাকারা: ১৮৩',
          ),

          SectionTitle('🕐 রোজার সময়সীমা'),
          SectionText('সুবহে সাদিক থেকে সূর্যাস্ত পর্যন্ত রোজা পালন করতে হয়।'),

          SectionTitle('🎯 রোজার উদ্দেশ্য'),
          SectionText(
            '১. তাকওয়া অর্জন\n২. আত্মশুদ্ধি\n৩. ধৈর্য\n৪. গরীবদের অনুভব\n৫. আল্লাহর সন্তুষ্টি',
          ),

          SectionTitle('✅ যাদের উপর রোজা ফরজ'),
          SectionText('• মুসলিম\n• বালেগ\n• সুস্থ\n• মুকীম (মুসাফির নয়)'),

          SectionTitle('❌ রোজা ভঙ্গকারী বিষয়সমূহ'),
          SectionText(
            'ইচ্ছাকৃত খাওয়া, পান, সহবাস, মাস্টারবেশন, ইচ্ছাকৃত বমি ইত্যাদি রোজা ভঙ্গ করে। ভুলে কিছু খাওয়া রোজা ভঙ্গ করে না।',
          ),

          SectionTitle('🍽️ সাহরী ও ইফতার'),
          SectionText(
            'সাহরী: ফজরের আগে খাবার খাওয়া\nইফতার: সূর্যাস্তে রোজা ভাঙ্গা\nদোয়া: اللَّهُمَّ لَكَ صُمْتُ وَعَلَى رِزْقِكَ أَفْطَرْتُ',
          ),

          SectionTitle('💎 রমজানের ফজিলত'),
          SectionText(
            '• কুরআন নাজিল\n• জান্নাতের দরজা খোলা\n• শয়তান শৃঙ্খলিত\n• ফরজের সওয়াব ৭০ গুণ',
          ),

          SectionTitle('🌙 ইতিকাফ ও লাইলাতুল কদর'),
          SectionText(
            'রমজানের শেষ দশকে ইতিকাফ এবং কদরের রাত অনুসন্ধান করা উত্তম।',
          ),

          SectionTitle('🤲 রোজার সময়ে করণীয়'),
          SectionText('• কুরআন তিলাওয়াত\n• নফল নামাজ\n• দোয়া, জিকির\n• সদকা'),

          SectionTitle('📅 রোজা ভেঙে ফেললে করণীয়'),
          SectionText(
            '• ইচ্ছাকৃত: কাফফারা\n• অসুস্থতা: পরে কাযা\n• স্থায়ী অসুস্থতা: ফিদিয়া প্রদান',
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class SectionText extends StatelessWidget {
  final String text;
  const SectionText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(text, style: const TextStyle(fontSize: 16)),
    );
  }
}
