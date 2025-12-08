import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hisn_almuslim/core/models/azkar_alazan.dart';
import 'package:hisn_almuslim/shared/custom_app_bar.dart';
import 'package:hisn_almuslim/shared/zekr_actions_widget.dart';
import 'package:hisn_almuslim/shared/zekr_content_widget.dart';
import 'package:hisn_almuslim/shared/zekr_header_widget.dart';
import 'package:hisn_almuslim/shared/zekr_info_widget.dart';
import 'package:hisn_almuslim/theme/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrayerScreen extends StatefulWidget {
  const PrayerScreen({super.key, this.initialIndex});
  final int? initialIndex;

  @override
  State<PrayerScreen> createState() => _PrayerScreenState();
}

class _PrayerScreenState extends State<PrayerScreen> {
  late int _currentIndex;
  PageController? _pageController;
  bool isLoading = true;

  /// Method to load the last page
  Future<int> loadPage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt("last_prayer_page") ?? 0;
  }

  /// Method to save the current page
  Future<void> savePage(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("last_prayer_page", index);
  }

  /// Method to init the page when toggeling
  Future<void> initPage() async {
    int savedPage = await loadPage();

    final safeStart =
        (widget.initialIndex != null &&
            widget.initialIndex! >= 0 &&
            widget.initialIndex! < azkarAlazan['content'].length)
        ? widget.initialIndex
        : savedPage;
    _currentIndex = safeStart!;
    _pageController = PageController(initialPage: safeStart);

    setState(() {
      _currentIndex = safeStart;
      _pageController = PageController(initialPage: safeStart);
      isLoading = false; // End Loading
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
      appBar: CustomAppBar(title: "${azkarAlazan['title']}", isDark: isDark),
      body: Column(
        children: [
          // Header
          ZekrHeaderWidget(
            currentIndex: _currentIndex,
            total: azkarAlazan['content'].length,
            isDark: isDark,
          ),

          // Content (Scrollable)
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: azkarAlazan['content'].length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
                savePage(index);
              },
              itemBuilder: (context, index) {
                final zekr = azkarAlazan['content'][index];
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
            zekr: azkarAlazan['content'][_currentIndex],
            currentIndex: _currentIndex,
            total: azkarAlazan['content'].length,
            pageController: _pageController!,
          ),
        ],
      ),
    );
  }
}
