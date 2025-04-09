import 'package:din_guide_app/common_widgets/auth_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'dart:math' as math;

class CompassScreen extends StatefulWidget {
  const CompassScreen({super.key});

  @override
  CompassScreenState createState() => CompassScreenState();
}

class CompassScreenState extends State<CompassScreen> {
  double? _heading;

  @override
  void initState() {
    super.initState();
    _startCompass();
  }

  void _startCompass() {
    FlutterCompass.events?.listen((event) {
      setState(() {
        _heading = event.heading;
      });
    });
  }

  String _getDirection(double heading) {
    List<String> directions = [
      "উত্তর",
      "উত্তর-উত্তর-পূর্ব",
      "উত্তর-পূর্ব",
      "পূর্ব-উত্তর-পূর্ব",
      "পূর্ব",
      "পূর্ব-দক্ষিণ-পূর্ব",
      "দক্ষিণ-পূর্ব",
      "দক্ষিণ-দক্ষিণ-পূর্ব",
      "দক্ষিণ",
      "দক্ষিণ-দক্ষিণ-পশ্চিম",
      "দক্ষিণ-পশ্চিম",
      "পশ্চিম-দক্ষিণ-পশ্চিম",
      "পশ্চিম",
      "পশ্চিম-উত্তর-পশ্চিম",
      "উত্তর-পশ্চিম",
      "উত্তর-উত্তর-পশ্চিম",
    ];
    int index = ((heading + 11.25) ~/ 22.5) % 16;
    return directions[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'কিবলা দিক নির্দেশক', leadingVisible: true,),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade800, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _heading != null ? _getDirection(_heading!) : 'দিক নির্ণয় হচ্ছে...',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'এই কম্পাস কিবলার দিক নির্দেশ করে।\nঅনুগ্রহ করে মোবাইলটি সোজাভাবে ধরুন।',
                style: TextStyle(fontSize: 16, color: Colors.white70),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepOrange,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 280,
                      height: 280,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueAccent.withAlpha(50),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: CustomPaint(painter: CompassDialPainter()),
                    ),

                    Transform.rotate(
                      angle: _heading == null
                          ? 0
                          : -(math.pi / 180) * ((_heading! - 270) % 360),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.navigation,
                            size: 45,
                            color: Colors.blue,
                          ),
                          Container(
                            width: 5,
                            height: 100,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Colors.white, Colors.white],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Colors.amberAccent,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          _heading != null
                              ? '${_heading!.toStringAsFixed(0)}°'
                              : '0°',
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'পশ্চিম দিকই কিবলা',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.amberAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CompassDialPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint tickPaint = Paint()
      ..color = Colors.white.withAlpha(150)
      ..strokeWidth = 2;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = size.width / 2;

    for (int i = 0; i < 360; i += 15) {
      final double angle = (i * math.pi) / 180;
      final double startX = centerX + (radius - 15) * math.cos(angle);
      final double startY = centerY + (radius - 15) * math.sin(angle);
      final double endX = centerX + radius * math.cos(angle);
      final double endY = centerY + radius * math.sin(angle);

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), tickPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
