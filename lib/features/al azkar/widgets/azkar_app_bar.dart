import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hisn_almuslim/core/cubit/cubit/azkar_cubit.dart';
import 'package:hisn_almuslim/features/al%20azkar/screen/zekr_details_screen.dart';
import 'package:hisn_almuslim/shared/custom_text.dart';
import 'package:lottie/lottie.dart';
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
      title: const CustomText(
        "الأذكار",
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white,
      ),
      actions: [
        GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: IconButton(
            icon: const Icon(
              CupertinoIcons.search,
              color: Colors.white,
              weight: 20,
              size: 27,
            ),
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
                    suggestion: Center(
                      child: Lottie.asset(
                        'assets/Quran.json',
                        height: 400,
                        width: 400,
                      ),
                    ),
                    failure: const Center(
                      child: CustomText('لا توجد نتائج مطابقة'),
                    ),
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
                          : "لا توجد نتائج متطابقه";

                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ZekrDetailsScreen(
                                zekr: zekr,
                                initialIndex: 0,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.teal.shade500,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 10,
                              children: [
                                Row(
                                  spacing: 6,
                                  children: [
                                    Image.asset(
                                      "assets/images/decoor.png",
                                      fit: BoxFit.cover,
                                      width: 40,
                                    ),
                                    CustomText(
                                      zekr.title,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      height: 1.6,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                                // Content of Zikr
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    content,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[100],
                                      fontFamily: "Cairo",
                                    ),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    textDirection: TextDirection.rtl,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
