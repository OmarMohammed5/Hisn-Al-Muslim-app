import 'package:flutter/material.dart';
import 'package:hisn_almuslim/features/al%20zekr/widgets/content_app_bar.dart';
import 'package:hisn_almuslim/features/al%20zekr/widgets/content_of_takbeer.dart';

class TakbeerScreen extends StatelessWidget {
  const TakbeerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: ContentAppBar(title: "التكبير"),
      body: SingleChildScrollView(
        child: Center(child: ContentOfTakbeer(isDark: isDark)),
      ),
    );
  }
}
