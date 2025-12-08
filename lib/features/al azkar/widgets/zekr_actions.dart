import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hisn_almuslim/helpers/share_helper.dart';
import 'package:hisn_almuslim/core/models/content_item.dart';
import 'package:hisn_almuslim/shared/custom_text.dart';
import 'package:hisn_almuslim/shared/custom_snack_bar.dart';

class ZekrActions extends StatelessWidget {
  final PageController pageController;
  final int currentIndex;
  final int total;
  final Zekr zekr;
  final ContentItem content;

  const ZekrActions({
    super.key,
    required this.pageController,
    required this.currentIndex,
    required this.total,
    required this.zekr,
    required this.content,
  });

  void _goToNext(BuildContext context) {
    if (currentIndex < total - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    if (currentIndex == total - 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        customSnackBar(
          "لقد وصلت لنهاية الأذكار",
          Colors.grey.shade800,
          Icons.check,
        ),
      );
    }
  }

  void _copyText(BuildContext context) {
    Clipboard.setData(ClipboardData(text: content.text));
    ScaffoldMessenger.of(context).showSnackBar(
      customSnackBar("تم نسخ الذكر بنجاح ", Colors.grey.shade800, Icons.check),
    );
  }

  void _shareZekr(BuildContext context) async {
    // final String zekrText = zekr.content.map((c) => c.text).join("\n\n"); // to share all content in zekr
    final String zekrText = content.text; // to share only current content
    await ShareHelper.shareAsImage(context, zekrText);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Share
          _actionButton(Icons.share, () => _shareZekr(context)),

          // Go to next
          GestureDetector(
            onTap: () => _goToNext(context),
            child: Container(
              width: 120,
              height: 90,
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.teal.shade800, width: 4),
              ),
              child: const Center(
                child: CustomText(
                  "التالي",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Copy
          _actionButton(Icons.copy, () => _copyText(context)),
        ],
      ),
    );
  }

  Widget _actionButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.teal.shade800,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, color: Colors.white, size: 25),
      ),
    );
  }
}
