import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildShimmerList() {
  return ListView.builder(
    shrinkWrap: true,
    primary: false,
    itemCount: 15,
    itemBuilder: (context, index) {
      return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Card(
          color: Colors.white,
          child: ListTile(
            title: Container(height: 10, width: 100, color: Colors.white),
            subtitle: Container(height: 10, width: 150, color: Colors.white),
            leading: const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.white,
            ),
          ),
        ),
      );
    },
  );
}
