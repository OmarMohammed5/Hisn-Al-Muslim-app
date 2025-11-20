import 'package:flutter/material.dart';
import 'package:hisn_almuslim/core/models/evening_azkar.dart';
import 'package:hisn_almuslim/presentation/widgets/zekr_actions_widget.dart';
import 'package:hisn_almuslim/presentation/widgets/zekr_content_widget.dart';
import 'package:hisn_almuslim/presentation/widgets/zekr_header_widget.dart';
import 'package:hisn_almuslim/presentation/widgets/zekr_info_widget.dart';
import 'package:hisn_almuslim/theme/app_colors.dart';
import 'package:hisn_almuslim/theme/app_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EveningAzkarScreen extends StatefulWidget {
  const EveningAzkarScreen({super.key, this.initialIndex});
  final int? initialIndex;

  @override
  State<EveningAzkarScreen> createState() => _EveningAzkarScreenState();
}

class _EveningAzkarScreenState extends State<EveningAzkarScreen> {
  late int _currentIndex;
  PageController? _pageController;
  bool isLoading = true;

  /// Method to load the last page
  Future<int> loadPage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt("last_evening_page") ?? 0;
  }

  /// Save the current page
  Future<void> savePage(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("last_evening_page", index);
  }

  /// init the page when toggleing
  Future<void> initPage() async {
    int savedPage = await loadPage();

    final safeStart =
        (widget.initialIndex != null &&
            widget.initialIndex! >= 0 &&
            widget.initialIndex! < eveningAzkar['content'].length)
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
          child: CircularProgressIndicator(color: AppColors.kIconColor),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.teal.shade800,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: AppText(
          "${eveningAzkar['title']}",
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: eveningAzkar['content'].length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
          savePage(index);
        },
        itemBuilder: (BuildContext context, int index) {
          final zekr = eveningAzkar['content'][index];
          return Column(
            children: [
              ZekrHeaderWidget(
                currentIndex: _currentIndex,
                total: eveningAzkar['content'].length,
                isDark: isDark,
              ),
              ZekrInfoWidget(zekr: zekr),
              ZekrContentWidget(zekr: zekr),
              ZekrActionsWidget(
                zekr: zekr,
                currentIndex: _currentIndex,
                total: eveningAzkar['content'].length,
                pageController: _pageController!,
              ),
            ],
          );
        },
      ),
    );
  }
}
