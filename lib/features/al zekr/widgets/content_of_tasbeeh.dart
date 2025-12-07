import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ContentOfTasbeeh extends StatelessWidget {
  const ContentOfTasbeeh({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(30),
        Card(
          color: isDark ? Colors.grey[850] : Colors.white,
          margin: const EdgeInsets.all(12),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "قال شيخ الإسلام ابْنُ تيمية: الأمْرُ بِتَسبيحِه"
              " يقتضي التنزيهَ والتَّعظيمَ، والتَّعظيمُ يَستلزِمُ إثباتَ المَحامِد التي يُحمَد عليها،"
              "فيقتضي ذلك تنزيهَه وتَحميدَه وتكبيرَه وتوحيدَه\n\n"
              "وقال: أما معنى [وبحمده] فهي تعني الجمع بين التسبيح والحمد، إما على وجه الحال، أو على وجه العطف، "
              "والتقدير: أُسبِّح الله تعالى حال كوني حامدًا له، أو أُسبِّح الله تعالى وأحمده.\n\n"
              "فعن حذيفة رضي الله عنه ... (أخرجه أحمد)\n\n"
              "وعن أبي هريرة رضي الله عنه أن رسول الله صلى الله عليه وسلم قال: "
              "«من قال سبحان الله وبحمده مائة مرة حطت خطاياه وإن كانت مثل زبد البحر» (مُتفقٌ عليه).",
              style: TextStyle(
                fontSize: 18,
                height: 1.8,
                fontFamily: "Amiri Quran",
              ),
            ),
          ),
        ),
      ],
    );
  }
}
