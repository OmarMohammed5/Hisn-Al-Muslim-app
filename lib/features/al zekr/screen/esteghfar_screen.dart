import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hisn_almuslim/features/al%20zekr/widgets/content_of_esteghfar.dart';
import 'package:hisn_almuslim/shared/custom_text.dart';

class EsteghfarScreen extends StatelessWidget {
  const EsteghfarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: isDark ? Color(0xff222222) : Color(0xfff5f5f5),
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
            "أستغفر اللّٰه",
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ContentOfEsteghfar(isDark: isDark),
              Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
