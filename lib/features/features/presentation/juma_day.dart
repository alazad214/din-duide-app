import 'package:din_guide_app/common_widgets/auth_appbar.dart';
import 'package:flutter/material.dart';

class JummahInfoScreen extends StatelessWidget {
  const JummahInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(
        title: 'জুমার দিন - Jummah Day',
        leadingVisible: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
   
            Text(
              "জুমার দিনটির গুরুত্ব",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
          
            Text(
              "জুমার (শুক্রবার) দিন ইসলামে বিশেষ গুরুত্ব বহন করে এবং এটি মুসলিমদের জন্য একটি পবিত্র এবং কল্যাণময় দিন হিসেবে বিবেচিত। "
              "জুমার দিনে কয়েকটি গুরুত্বপূর্ণ আমল এবং ঐতিহ্য রয়েছে, যা মুসলিমদের জীবনে আধ্যাত্মিক উন্নতি এবং বরকত নিয়ে আসে। "
              "এ দিন নামাজ এবং দোয়া কবুলের জন্য বিশেষ সুযোগ রয়েছে।",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            SizedBox(height: 16),
          
            Text(
              "জুমার আমল",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            BulletPointList(
              items: [
                "তাজা গোসল (গোসল করা)",
                "দরুদ শরিফ পাঠ করা",
                "কুরআন পাঠ ও সুরা আল-খামসাহ পড়া",
                "জুমার নামাজের পূর্বে মসজিদে পৌঁছানো",
                "প্রথম নামাজ পড়ার পরে দোয়া করা",
              ],
            ),
            SizedBox(height: 16),
         
            Text(
              "বিশেষ দোয়া",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            BulletPointList(
              items: [
                "সুরা আল-ফাতিহা (সূরা আল-ফাতিহা)",
                "দোয়া ইষ্টিখারা",
                "পুনরায় মুসলিম জাতির জন্য দোয়া",
                "জুমার দিন আল্লাহর কাছে দোয়া করা এবং তাওবা করা",
              ],
            ),
            SizedBox(height: 16),
           
            Text(
              "জুমার দিনের পুণ্য",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "শুক্রবারের দিনে আল্লাহর বিশেষ বরকত রয়েছে এবং এই দিনকে সবচেয়ে গুরুত্বপূর্ণ দিন হিসেবে মনে করা হয়।"
              "জুমার নামাজের জন্য যে কেউ উপস্থিত থাকে তার গুনাহ মাফ করা হয় এবং আল্লাহ তার দোয়া কবুল করেন। "
              "এটি এমন একটি দিন, যে দিনটি মুসলিমদের জন্য আধ্যাত্মিক উন্নতির জন্য চমৎকার সুযোগ প্রদান করে।",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            SizedBox(height: 16),
          
            Text(
              "জুমার দিনের হাদিসের শিক্ষা",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "জুমার দিনে মুহাম্মাদ (সা.) এর অনেক গুরুত্বপূর্ণ হাদিস রয়েছে যা মুসলিমদের পথপ্রদর্শন করে। "
              "হাদিসের মধ্যে উল্লেখযোগ্য বিষয় হলো, যে ব্যক্তি এই দিনে পুরো শরীরের গোসল করে, দেরি না করে মসজিদে পৌঁছায় এবং "
              "বিপরীতে অতিরিক্ত কাজ ও কথা না বলে কেবল নামাজে মনোনিবেশ করে তার সকল গুনাহ মাফ করা হয়।",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            SizedBox(height: 16),
        
            Text(
              "সালাত আল-জুমা (জুমার নামাজ)",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "জুমার নামাজ খুবই গুরুত্বপূর্ণ, এটি মুসলিমদের জন্য এক সপ্তাহের মধ্যে সেরা নামাজ। "
              "মুসলিমরা এই দিনে দুপুরের নামাজের সময় মসজিদে একত্রিত হয়ে একসাথে সালাত আল-জুমা আদায় করেন।"
              "যে ব্যক্তি একবিংশ শতাব্দীর বেলা এই নামাজ না আদায় করলে তার জন্য খুবই কঠিন পরিণতি অপেক্ষা করছে।",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}

class BulletPointList extends StatelessWidget {
  final List<String> items;

  const BulletPointList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          items.map((item) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.circle, size: 6, color: Colors.black),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
    );
  }
}
