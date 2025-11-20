import 'package:flutter/material.dart';
import 'package:hisn_almuslim/core/models/zekr_model.dart';
import 'package:hisn_almuslim/presentation/widgets/zekr_counter_card.dart';

class ZekrCounterBuild extends StatelessWidget {
  const ZekrCounterBuild({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: zekrList.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 4.6 / 4,
      ),
      itemBuilder: (context, index) {
        final zekr = zekrList[index];
        return ZekrCounterCard(
          title: zekr.title,
          index: index,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return zekr.screen;
                },
              ),
            );
          },
        );
      },
    );
  }
}
