import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hisn_almuslim/core/cubit/cubit/counter_cubit.dart';
import 'package:hisn_almuslim/shared/app_text.dart';

class ZekrCounterCard extends StatelessWidget {
  const ZekrCounterCard({
    super.key,
    required this.title,
    required this.index,
    required this.onTap,
  });

  final String title;
  final int index;

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final screenH = MediaQuery.of(context).size.height;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenW = MediaQuery.of(context).size.width;

    return BlocBuilder<CounterCubit, Map<int, int>>(
      builder: (context, state) {
        final count = state[index] ?? 0;
        return GestureDetector(
          onTap: () {
            context.read<CounterCubit>().add(index);
          },
          child: Container(
            height: screenH * 0.66,
            width: screenW * 0.46,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isDark ? Colors.grey[850] : Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 4,
                        ),
                        child: GestureDetector(
                          onTap: onTap,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Icon(
                              Icons.info_outline_rounded,
                              size: 22,
                              color: Colors.teal.shade800,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(10),
                  AppText(title, fontSize: 16, maxLines: 3),
                  Gap(15),
                  Divider(color: Colors.grey, indent: 35, endIndent: 35),
                  Gap(5),
                  AppText("$count", fontSize: 14),
                  Gap(10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
