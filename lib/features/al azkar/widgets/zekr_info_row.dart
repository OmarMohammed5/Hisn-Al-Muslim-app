import 'package:flutter/material.dart';
import 'package:hisn_almuslim/shared/app_text.dart';

class ZekrInfoRow extends StatelessWidget {
  final int count;
  final String source;

  const ZekrInfoRow({super.key, required this.count, required this.source});

  void _showInfoDialog(BuildContext context) {
    if (source.isEmpty) return;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          "معلومات إضافية",
          style: TextStyle(
            color: Colors.teal.shade800,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        content: Text(
          "المصدر: $source",
          style: const TextStyle(
            fontFamily: "Amiri Quran",
            fontSize: 15,
            height: 1.6,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: AppText("إغلاق", color: Colors.green.shade600),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => _showInfoDialog(context),
            child: Icon(
              Icons.info_outline,
              color: Colors.teal.shade800,
              size: 30,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.teal.shade800,
              borderRadius: BorderRadius.circular(6),
            ),
            child: AppText(
              "عدد التكرار : $count",
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
