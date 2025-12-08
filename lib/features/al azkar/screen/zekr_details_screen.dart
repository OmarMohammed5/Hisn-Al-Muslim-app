import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hisn_almuslim/core/models/content_item.dart';
import 'package:hisn_almuslim/features/al%20azkar/widgets/zekr_actions.dart';
import 'package:hisn_almuslim/features/al%20azkar/widgets/zekr_app_bar.dart'
    show ZekrAppBar;
import 'package:hisn_almuslim/features/al%20azkar/widgets/zekr_content.dart';
import 'package:hisn_almuslim/features/al%20azkar/widgets/zekr_header.dart';
import 'package:hisn_almuslim/features/al%20azkar/widgets/zekr_info_row.dart';
import 'package:hisn_almuslim/theme/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ZekrDetailsScreen extends StatefulWidget {
  final Zekr zekr;
  final int initialIndex;

  const ZekrDetailsScreen({
    super.key,
    required this.zekr,
    required this.initialIndex,
  });

  @override
  State<ZekrDetailsScreen> createState() => _ZekrDetailsScreenState();
}

class _ZekrDetailsScreenState extends State<ZekrDetailsScreen> {
  PageController? _pageController;
  late int _currentIndex;
  bool isLoading = true;
  bool _isPageInitialized = false;

  // String get _prefKey => "last_page_${widget.zekr.title.replaceAll(' ', '_')}";

  /// Method to load the last page
  Future<int> loadPage() async {
    final prefs = await SharedPreferences.getInstance();
    final key = "last_page_${widget.zekr.title}";
    final page = prefs.getInt(key) ?? 0;
    return page;
  }

  /// Method to save the current page
  Future<void> savePage(int index) async {
    final prefs = await SharedPreferences.getInstance();
    final key = "last_page_${widget.zekr.title}";

    await prefs.setInt(key, index);
  }

  /// Method to init the page when triggering
  Future<void> initPage() async {
    final savedPage = await loadPage();

    int safeStart = (savedPage >= 0 && savedPage < widget.zekr.content.length)
        ? savedPage
        : 0;

    _pageController = PageController(initialPage: safeStart);

    setState(() {
      _currentIndex = safeStart;
      isLoading = false;
    });

    if (_isPageInitialized) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController!.jumpToPage(safeStart);
      _isPageInitialized = true;
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
    final contents = widget.zekr.content;
    final total = contents.length;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    /// if it is still loading display >> CircularProgressIndicator
    if (isLoading || _pageController == null) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: AppColors.kIconColor),
        ),
      );
    }
    return Scaffold(
      appBar: ZekrAppBar(title: widget.zekr.title),
      body: PageView.builder(
        controller: _pageController,
        itemCount: total,
        onPageChanged: (index) {
          if (!_isPageInitialized) return; // Dont save before init
          setState(() => _currentIndex = index);
          savePage(index);
        },

        itemBuilder: (context, pageIndex) {
          final content = contents[pageIndex];

          return Column(
            children: [
              ZekrHeader(currentIndex: _currentIndex, total: total),
              const Gap(20),
              ZekrInfoRow(count: content.count.length, source: content.source),
              const Gap(30),
              Expanded(child: ZekrContent(content: content)),
              ZekrActions(
                pageController: _pageController!,
                currentIndex: _currentIndex,
                total: total,
                zekr: widget.zekr,
                content: content,
                isDark: isDark,
              ),
            ],
          );
        },
      ),
    );
  }
}
