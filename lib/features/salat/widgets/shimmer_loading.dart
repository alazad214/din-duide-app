import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 45),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: SizedBox(
              height: 90,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ListView.builder(
                  itemCount: 7,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(0),
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 14),
                      child: SizedBox(
                        width: 55,
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 90,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          const SizedBox(height: 70),

          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: ListView.builder(
              itemCount: 6,
              shrinkWrap: true,

              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 76,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}