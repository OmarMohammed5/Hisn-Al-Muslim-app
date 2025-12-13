import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hisn_almuslim/features/al%20zekr/widgets/content_app_bar.dart';
import 'package:hisn_almuslim/features/al%20zekr/widgets/content_of_prayer.dart';

class PrayerForTheProphet extends StatelessWidget {
  const PrayerForTheProphet({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: ContentAppBar(title: "الصلاة على النبي ﷺ"),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ContentOfPrayer(isDark: isDark),
              Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
