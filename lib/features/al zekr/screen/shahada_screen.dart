import 'package:flutter/material.dart';
import 'package:hisn_almuslim/features/al%20zekr/widgets/content_app_bar.dart';
import 'package:hisn_almuslim/features/al%20zekr/widgets/content_of_shahada.dart';

class ShahadaScreen extends StatelessWidget {
  const ShahadaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: ContentAppBar(title: "الشهادة"),
      body: SingleChildScrollView(
        child: Center(child: ContentOfShahada(isDark: isDark)),
      ),
    );
  }
}
