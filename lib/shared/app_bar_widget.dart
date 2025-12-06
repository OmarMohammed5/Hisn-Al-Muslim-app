import 'package:flutter/material.dart';
import 'package:hisn_almuslim/shared/app_text.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;
  @override
  Size get preferredSize => Size.fromHeight(70);
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return AppBar(
      centerTitle: true,
      scrolledUnderElevation: 0,
      title: Container(
        // padding: EdgeInsets.all(16),
        // decoration: BoxDecoration(
        //   // color: isDark ? Colors.grey[850] : Colors.grey.shade300,

        //   gradient: LinearGradient(
        //     colors:
        //         // isDark
        //         //     ? [Colors.teal.shade900, Colors.green.shade900]
        //         //     : [Colors.teal.shade700, Colors.green.shade600],
        //         [Colors.teal.shade900, Colors.green.shade900],
        //   ),
        //   borderRadius: BorderRadius.only(
        //     topLeft: Radius.circular(30),
        //     bottomRight: Radius.circular(30),
        //     topRight: Radius.circular(8),
        //     bottomLeft: Radius.circular(8),
        //   ),
        //   boxShadow: [
        //     BoxShadow(
        //       color: Colors.black12,
        //       blurRadius: 6,
        //       offset: Offset(0, 2),
        //     ),
        //   ],
        // ),
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
        child: AppText(
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
