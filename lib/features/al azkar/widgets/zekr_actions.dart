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
  final bool isDark;

  const ZekrActions({
    super.key,
    required this.pageController,
    required this.currentIndex,
    required this.total,
    required this.zekr,
    required this.content,
    required this.isDark,
  });

  // Go to the next page
  void _goToNext(BuildContext context) {
    if (currentIndex < total - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        customSnackBar(
          "لقد وصلت لنهاية الأذكار",
          Icons.info_outline,
          context,
          lightColor: Colors.grey.shade800,
          darkColor: Colors.white12,
        ),
      );
    }
  }

  // Go to the previous page
  void _goToPrevious(BuildContext context) {
    if (currentIndex > 0) {
      pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        customSnackBar(
          "لقد وصلت إلى بداية الأذكار",
          Icons.info_outline,
          context,
          lightColor: Colors.grey.shade800,
          darkColor: Colors.white12,
        ),
      );
    }
  }

  // Copy Text
  void _copyText(BuildContext context) {
    Clipboard.setData(ClipboardData(text: content.text));
    ScaffoldMessenger.of(context).showSnackBar(
      customSnackBar(
        "تم نسخ الذكر بنجاح",
        Icons.check_circle,
        context,
        lightColor: Colors.teal,
        darkColor: Colors.teal.shade700,
      ),
    );
  }

  // Share Zikr
  void _shareZekr(BuildContext context) async {
    final String zekrText = content.text;
    await ShareHelper.shareAsImage(context, zekrText);
  }

  @override
  Widget build(BuildContext context) {
    // late bool isLastPage = widget.currentIndex == widget.total - 1;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      margin: EdgeInsets.only(bottom: 20, left: 16, right: 16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(100),
          topLeft: Radius.circular(100),
          bottomLeft: Radius.circular(100),
          bottomRight: Radius.circular(100),
        ),
        gradient: LinearGradient(
          colors: [
            Colors.teal.shade900.withValues(alpha: .90),
            Colors.teal.shade600.withValues(alpha: 0.75),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Share Button
          _actionButton(
            icon: Icons.share_outlined,
            label: "مشاركة",
            onTap: () => _shareZekr(context),
          ),

          // Previous Button
          _actionButton(
            icon: Icons.arrow_back,
            label: "السابق",
            isLarge: true,
            onTap: () => _goToPrevious(context),
          ),

          // Next Button
          _actionButton(
            icon: Icons.arrow_forward_rounded,
            label: "التالي",
            isLarge: true,
            onTap: () => _goToNext(context),
          ),
          // Copy Button
          _actionButton(
            icon: Icons.copy_rounded,
            label: "نسخ",
            onTap: () => _copyText(context),
          ),
        ],
      ),
    );
  }

  Widget _actionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool isLarge = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: isLarge ? 60 : 45,
            height: isLarge ? 60 : 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Colors.white.withValues(alpha: 0.25),
                  Colors.white.withValues(alpha: 0.1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(color: Colors.white30),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Icon(icon, color: Colors.white, size: isLarge ? 35 : 28),
          ),
          const SizedBox(height: 8),
          CustomText(
            label,
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
