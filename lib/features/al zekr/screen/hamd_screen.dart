import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hisn_almuslim/features/al%20zekr/widgets/content_app_bar.dart';
import 'package:hisn_almuslim/features/al%20zekr/widgets/content_of_hamd.dart';

class HamdScreen extends StatelessWidget {
  const HamdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: ContentAppBar(title: "الحمد لله"),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Gap(30),
              ContentOfHamd(isDark: isDark),
              Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
