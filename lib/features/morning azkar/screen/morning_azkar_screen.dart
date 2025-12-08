import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hisn_almuslim/core/models/morning_azkar.dart';
import 'package:hisn_almuslim/shared/custom_app_bar.dart';
import 'package:hisn_almuslim/shared/zekr_actions_widget.dart';
import 'package:hisn_almuslim/shared/zekr_content_widget.dart';
import 'package:hisn_almuslim/shared/zekr_header_widget.dart';
import 'package:hisn_almuslim/shared/zekr_info_widget.dart';
import 'package:hisn_almuslim/theme/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MorningAzkarScreen extends StatefulWidget {
  const MorningAzkarScreen({super.key, this.initialIndex});
  final int? initialIndex;

  @override
  State<MorningAzkarScreen> createState() => _MorningAzkarScreenState();
}

class _MorningAzkarScreenState extends State<MorningAzkarScreen> {
  late int _currentIndex;
  PageController? _pageController;
  bool isLoading = true;

  /// Method to load the last page
  Future<int> loadPage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt("last_morning_page") ?? 0;
  }

  /// Save the current page
  Future<void> savePage(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('last_morning_page', index);
  }

  @override
  void initState() {
    super.initState();
    _initPage();
  }

  /// init the page when toggleing
  Future<void> _initPage() async {
    int savedPage = await loadPage();

    final safeStart =
        (widget.initialIndex != null &&
            widget.initialIndex! >= 0 &&
            widget.initialIndex! < morningAzkar['content'].length)
        ? widget.initialIndex!
        : savedPage;

    setState(() {
      _currentIndex = safeStart;
      _pageController = PageController(initialPage: safeStart);
      isLoading = false; // End loading
    });
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
      appBar: CustomAppBar(title: "${morningAzkar['title']}", isDark: isDark),
      body: PageView.builder(
        controller: _pageController,
        itemCount: morningAzkar['content'].length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
          savePage(index); // To Save a new page
        },
        itemBuilder: (BuildContext context, int index) {
          final zekr = morningAzkar['content'][index];
          return Column(
            children: [
              ZekrHeaderWidget(
                currentIndex: _currentIndex,
                total: morningAzkar['content'].length,
                isDark: isDark,
              ),
              ZekrInfoWidget(zekr: zekr),
              ZekrContentWidget(zekr: zekr),
              ZekrActionsWidget(
                zekr: zekr,
                currentIndex: _currentIndex,
                total: morningAzkar['content'].length,
                pageController: _pageController!,
              ),
            ],
          );
        },
      ),
    );
  }
}
