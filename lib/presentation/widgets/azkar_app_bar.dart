import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hisn_almuslim/core/cubit/cubit/azkar_cubit.dart';
import 'package:hisn_almuslim/presentation/screens/zekr_details_screen.dart';
import 'package:hisn_almuslim/theme/app_text.dart';
import 'package:search_page/search_page.dart';

class AzkarAppBar extends StatefulWidget implements PreferredSizeWidget {
  const AzkarAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(65);

  @override
  State<AzkarAppBar> createState() => _AzkarAppBarState();
}

class _AzkarAppBarState extends State<AzkarAppBar> {
  // Method to remove Tashkeel
  // String normalize(String input) {
  //   return input.replaceAll(RegExp(r'[ًٌٍَُِّْ]'), '');
  // }

  // Method to normalize Arabic text (remove tashkeel and handle hamza forms)
  String normalize(String input) {
    // To Remove tashkeel
    String output = input.replaceAll(RegExp(r'[ًٌٍَُِّْ]'), '');

    // To Replace letters (Hamza)
    output = output
        .replaceAll('أ', 'ا')
        .replaceAll('إ', 'ا')
        .replaceAll('آ', 'ا')
        .replaceAll('ؤ', 'و')
        .replaceAll('ئ', 'ي')
        .replaceAll('ة', 'ه');

    // To Remove increasing space
    output = output.replaceAll(RegExp(r'\s+'), ' ').trim();

    // To convert the all text into Lowercase
    return output.toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.teal.shade800,
      toolbarHeight: kToolbarHeight,
      iconTheme: const IconThemeData(color: Colors.white),
      title: const AppText(
        "الأذكار",
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white,
      ),
      actions: [
        IconButton(
          icon: const Icon(CupertinoIcons.search, color: Colors.white),
          onPressed: () {
            final azkarCubit = context.read<AzkarCubit>();
            if (azkarCubit.state is AzkarLoaded) {
              final azkarList = (azkarCubit.state as AzkarLoaded).zekrList;

              showSearch(
                context: context,
                delegate: SearchPage(
                  items: azkarList,
                  searchLabel: 'ابحث عن ذكر ...',
                  searchStyle: const TextStyle(fontFamily: "Cairo"),
                  barTheme: Theme.of(context),
                  suggestion: const Center(
                    child: AppText('ابدأ الكتابة للبحث عن ذكر'),
                  ),
                  failure: const Center(child: AppText('لا توجد نتائج مطابقة')),
                  // filter: (zekr) => [
                  //   normalize(zekr.title.toLowerCase()),
                  //   ...zekr.content.map((c) => normalize(c.text.toLowerCase())),
                  // ],
                  filter: (zekr) => [
                    normalize(zekr.title),
                    ...zekr.content.map((c) => normalize(c.text)),
                  ],

                  builder: (zekr) {
                    final content = zekr.content.isNotEmpty
                        ? "${zekr.content.first.text.substring(0, zekr.content.first.text.length > 50 ? 50 : zekr.content.first.text.length)}..."
                        : "لا يوجد نتائج متطابقه";

                    return ListTile(
                      title: AppText(
                        zekr.title,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        height: 1.6,
                      ),
                      subtitle: Text(
                        content,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[500],
                          fontFamily: "Cairo",
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textDirection: TextDirection.rtl,
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) =>
                                ZekrDetailsScreen(zekr: zekr, initialIndex: 0),
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
