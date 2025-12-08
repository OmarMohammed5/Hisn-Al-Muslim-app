import 'package:flutter/material.dart';
import 'package:hisn_almuslim/shared/custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, required this.isDark});
  final String title;
  final bool isDark;
  @override
  Size get preferredSize => Size.fromHeight(70);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      scrolledUnderElevation: 0,
      backgroundColor: isDark ? Color(0xff2e2e2e) : Color(0xffe0e0e0),
      iconTheme: IconThemeData(
        size: 27,
        color: isDark ? Colors.white : Colors.teal.shade700,
      ),
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? [Colors.teal.shade900, Colors.green.shade900]
                : [Colors.teal.shade400, Colors.green.shade500],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withValues(alpha: 0.4)
                  : Colors.green.shade100,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: CustomText(
          // "${morningAzkar['title']}",
          title,
          // color: AppColors.kIconColor,
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
