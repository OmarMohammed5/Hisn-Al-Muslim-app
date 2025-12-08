import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hisn_almuslim/core/models/sleeping_azkar.dart';
import 'package:hisn_almuslim/shared/custom_app_bar.dart';
import 'package:hisn_almuslim/shared/zekr_actions_widget.dart';
import 'package:hisn_almuslim/shared/zekr_content_widget.dart';
import 'package:hisn_almuslim/shared/zekr_header_widget.dart';
import 'package:hisn_almuslim/shared/zekr_info_widget.dart';
import 'package:hisn_almuslim/theme/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SleepingAzkarScreen extends StatefulWidget {
  const SleepingAzkarScreen({super.key, this.initialIndex});
  final int? initialIndex;

  @override
  State<SleepingAzkarScreen> createState() => _SleepingAzkarScreenState();
}

class _SleepingAzkarScreenState extends State<SleepingAzkarScreen> {
  late int _currentIndex;
  PageController? _pageController;
  bool isLoading = true;

  /// Method to load the last page
  Future<int> loadPage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt("last_sleep_page") ?? 0;
  }

  /// Method to Save the current page
  Future<void> savePage(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("last_sleep_page", index);
  }

  /// Method to init the page when toggleing
  Future<void> initPage() async {
    int savedPage = await loadPage();

    final safeStart =
        (widget.initialIndex != null &&
            widget.initialIndex! >= 0 &&
            widget.initialIndex! < sleepAzkar['content'].length)
        ? widget.initialIndex
        : savedPage;
    _currentIndex = safeStart!;
    _pageController = PageController(initialPage: safeStart);

    setState(() {
      _currentIndex = safeStart;
      _pageController = PageController(initialPage: safeStart);
      isLoading = false; // End loading
    });
  }

  @override
  void initState() {
    super.initState();
    initPage();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    // if it still loading display the CircularProgressIndicator
    if (isLoading || _pageController == null) {
      return Scaffold(
        body: Center(
          child: CupertinoActivityIndicator(
            color: AppColors.kIconColor,
            radius: 16,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: CustomAppBar(title: "${sleepAzkar['title']}", isDark: isDark),
      body: Column(
        children: [
          // Header
          ZekrHeaderWidget(
            currentIndex: _currentIndex,
            total: sleepAzkar['content'].length,
            isDark: isDark,
          ),

          // Content (Scrollable)
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: sleepAzkar['content'].length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
                savePage(index);
              },
              itemBuilder: (context, index) {
                final zekr = sleepAzkar['content'][index];
                return ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  children: [
                    ZekrInfoWidget(zekr: zekr),
                    ZekrContentWidget(zekr: zekr),
                  ],
                );
              },
            ),
          ),

          // Actions
          ZekrActionsWidget(
            zekr: sleepAzkar['content'][_currentIndex],
            currentIndex: _currentIndex,
            total: sleepAzkar['content'].length,
            pageController: _pageController!,
          ),
        ],
      ),
    );
  }
}
