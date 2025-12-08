import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hisn_almuslim/helpers/share_helper.dart';
import 'package:hisn_almuslim/shared/custom_text.dart';
import 'package:hisn_almuslim/shared/custom_snack_bar.dart';

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

  // Go to next page
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

  // Go to previous page
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      margin: EdgeInsets.all(12),
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
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Share Button
          _actionButton(
            icon: Icons.share_outlined,
            label: "مشاركة",
            onTap: () async {
              await ShareHelper.shareAsImage(context, zekr['text']);
            },
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
            onTap: () {
              Clipboard.setData(ClipboardData(text: zekr['text']));
              ScaffoldMessenger.of(context).showSnackBar(
                customSnackBar(
                  "تم نسخ الذكر بنجاح",
                  Icons.check_circle,
                  context,
                  lightColor: Colors.teal,
                  darkColor: Colors.teal.shade400,
                ),
              );
            },
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
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 2),
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
