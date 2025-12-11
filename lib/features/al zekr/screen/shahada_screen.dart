import 'package:flutter/material.dart';
import 'package:hisn_almuslim/features/al%20zekr/widgets/content_of_shahada.dart';
import 'package:hisn_almuslim/shared/custom_text.dart';

class ShahadaScreen extends StatelessWidget {
  const ShahadaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        toolbarHeight: 83,
        backgroundColor: isDark ? Colors.black38 : Color(0xfff5f5f5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60),
            bottomRight: Radius.circular(60),
          ),
        ),
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
            "لا إله إلا اللّٰه",
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(child: ContentOfShahada(isDark: isDark)),
      ),
    );
  }
}
