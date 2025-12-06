import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ContentOfShahada extends StatelessWidget {
  const ContentOfShahada({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(20),
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
              "لا إله إلا الله هي أفضل الكلام بعد القرآن، هي أحب الكلام إلى الله، "
              "وأفضل الكلام، وهي كلمة الإخلاص، وهي أول شيء دعت إليه الرسل -عليهم الصلاة والسلام- "
              "وأول شيء دعا إليه النبي ﷺ أن قال لقومه: قولوا: لا إله إلا الله؛ تفلحوا، "
              "هي كلمة الإخلاص كلمة التوحيد.\n\n"
              "ومعناها: لا معبود حق إلا الله، هذا معناها كما قال تعالى: "
              "ذَلِكَ بِأَنَّ اللَّهَ هُوَ الْحَقُّ وَأَنَّ مَا يَدْعُونَ مِنْ دُونِهِ هُوَ الْبَاطِلُ [الحج:62]. "
              "وهي نفي وإثبات (لا إله) نفي و(إلا الله) إثبات، (لا إله) تنفي جميع المعبودات، "
              "وجميع الآلهة بغير حق، و(إلا الله) تثبت العبادة بالحق لله وحده ، "
              "فهي أصل الدين وأساس الملة.\n\n"
              "والواجب على جميع المكلفين من جن، وإنس أن يأتوا بها رجالًا ونساء، "
              "مع إيمان بمعناها، واعتقاد له، وإخلاص العبادة لله وحده.",
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
