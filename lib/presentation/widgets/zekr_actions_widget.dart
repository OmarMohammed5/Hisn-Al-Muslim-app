import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hisn_almuslim/helpers/share_helper.dart';
import 'package:hisn_almuslim/theme/app_text.dart';

class ZekrActionsWidget extends StatelessWidget {
  final Map<String, dynamic> zekr;
  final int currentIndex;
  final int total;
  final PageController pageController;

  const ZekrActionsWidget({
    super.key,
    required this.zekr,
    required this.currentIndex,
    required this.total,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Share
          GestureDetector(
            onTap: () async {
              await ShareHelper.shareAsImage(context, zekr['text']);
            },
            child: _circleButton(Icons.share),
          ),

          // Next
          GestureDetector(
            onTap: () {
              if (currentIndex < total - 1) {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
            child: Container(
              width: 120,
              height: 90,
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.teal.shade800, width: 4),
              ),
              child: Center(
                child: AppText(
                  "التالي",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Copy
          GestureDetector(
            onTap: () {
              Clipboard.setData(ClipboardData(text: zekr['text']));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.grey[700],
                  content: AppText(
                    "تم نسخ الذكر بنجاح  ✅",
                    color: Colors.white,
                  ),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              );
            },
            child: _circleButton(Icons.copy),
          ),
        ],
      ),
    );
  }

  Widget _circleButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.teal.shade800,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 25),
    );
  }
}
