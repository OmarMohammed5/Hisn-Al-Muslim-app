import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hisn_almuslim/features/al%20zekr/widgets/content_app_bar.dart';
import 'package:hisn_almuslim/features/al%20zekr/widgets/content_of_esteghfar.dart';

class EsteghfarScreen extends StatelessWidget {
  const EsteghfarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: ContentAppBar(title: "أستغفر اللّٰه"),
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
