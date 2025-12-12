import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AzkarShimmerList extends StatelessWidget {
  const AzkarShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ListView.builder(
      padding: const EdgeInsets.only(top: 15),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Column(
          spacing: 15,
          children: [
            Shimmer.fromColors(
              baseColor: isDark ? Colors.grey.shade800 : Colors.grey.shade300,
              highlightColor: isDark
                  ? Colors.grey.shade700
                  : Colors.grey.shade100,
              child: Container(
                height: 60,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),

            Divider(
              color: isDark ? Colors.white24 : Colors.black26,
              indent: 20,
              endIndent: 20,
            ),
          ],
        );
      },
    );
  }
}
