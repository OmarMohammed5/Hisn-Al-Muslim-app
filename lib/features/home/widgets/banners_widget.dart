import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hisn_almuslim/core/models/azkar_daily.dart';
import 'package:hisn_almuslim/shared/app_text.dart';

class BannersWidget extends StatefulWidget {
  const BannersWidget({super.key});

  @override
  State<BannersWidget> createState() => _BannersWidgetState();
}

class _BannersWidgetState extends State<BannersWidget> {
  int _currentIndex = 0;
  late List<String> dailyAzkar;

  @override
  void initState() {
    super.initState();
    generateDailyAzkar();
  }

  void generateDailyAzkar() {
    final dayOfYear = DateTime.now()
        .difference(DateTime(DateTime.now().year, 1, 1))
        .inDays;
    final total = allAzkar.length;
    dailyAzkar = List.generate(3, (i) => allAzkar[(dayOfYear + i) % total]);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: dailyAzkar.length,
          itemBuilder: (context, index, _) {
            final zekr = dailyAzkar[index];
            return AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: LinearGradient(
                  colors: isDark
                      ? [Colors.teal.shade900, Colors.green.shade800]
                      : [Colors.teal.shade500, Colors.green.shade400],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                boxShadow: [
                  BoxShadow(
                    color: isDark
                        ? Colors.black.withValues(alpha: 0.3)
                        : Colors.green.shade100,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: -2.2,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.green.shade800
                            : Colors.teal.shade700,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: AppText(
                        "ذكر اليوم :",
                        color: Colors.white,
                        fontSize: 14,
                        maxLines: 4,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        zekr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          // color: isDark ? Colors.white : Colors.black87,
                          color: Colors.white,
                          fontSize: 16,
                          height: 1.5,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          options: CarouselOptions(
            height: size.height * 0.18,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 1000),
            autoPlayCurve: Curves.easeInOut,
            viewportFraction: 0.9,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() => _currentIndex = index);
            },
          ),
        ),
        const Gap(12),

        /// Indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: dailyAzkar.asMap().entries.map((entry) {
            final bool isActive = _currentIndex == entry.key;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: isActive ? 20 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: isActive
                    ? const Color.fromARGB(255, 31, 134, 36)
                    : Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
