import 'package:flutter/material.dart';
import 'package:hisn_almuslim/shared/custom_text.dart';

class ZekrInfoWidget extends StatelessWidget {
  final Map<String, dynamic> zekr;

  const ZekrInfoWidget({super.key, required this.zekr});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: CustomText(
                    "معلومات إضافية",
                    color: Colors.teal.shade800,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (zekr['source'].toString().isNotEmpty)
                        Text(
                          "المصدر: ${zekr['source']}",
                          style: const TextStyle(
                            fontSize: 15,
                            height: 1.8,
                            fontFamily: "Amiri Quran",
                          ),
                        ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: CustomText("إغلاق", color: Colors.green.shade600),
                    ),
                  ],
                ),
              );
            },
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
            child: CustomText(
              "عدد التكرار : ${zekr['count']}",
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
