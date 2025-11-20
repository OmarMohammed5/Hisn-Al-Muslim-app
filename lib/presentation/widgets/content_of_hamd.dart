import 'package:flutter/material.dart';

class ContentOfHamd extends StatelessWidget {
  const ContentOfHamd({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isDark ? Colors.grey[850] : Colors.white,
      margin: const EdgeInsets.all(12),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "الحمد لله\" كلمةٌ من أحسن الكلمات التي يُعمر بها الجَنان، وينطق بها اللسان، "
          "وتسمعها الأذنان، وتخطُّها للحقِّ البَنان.\n\n"
          "و\"الحمد لله\" من أطيب ما تعطرت بلفظه الأفواه، واستراحت به النفوس، "
          "وكثرت به الأجور، وارتفعت به المنزلة عند الله رب العالمين.\n\n"
          "الحمد لله\" هي أول الكلام ونهايته، وأول الخلق وخاتمته، قال تعالى: "
          "﴿ الْحَمْدُ لِلَّهِ الَّذِي خَلَقَ السَّمَاوَاتِ وَالْأَرْضَ وَجَعَلَ الظُّلُمَاتِ وَالنُّورَ "
          "ثُمَّ الَّذِينَ كَفَرُوا بِرَبِّهِمْ يَعْدِلُونَ ﴾ [الأنعام: 1]. وقال تعالى: "
          "﴿ وَقُضِيَ بَيْنَهُمْ بِالْحَقِّ وَقِيلَ الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ ﴾ [الزمر: 75]. "
          "وأول سورة في ترتيب المصحف الشريف مبدوءة بالحمد، وبها افتتحت خمس سور من القرآن: "
          "الفاتحة، والأنعام، والكهف، وسبأ، وفاطر. وما ذلك إلا لفضل هذه الكلمة وعظم مكانتها.\n\n"
          "إن حمد الله يعني: الثناء على الله تعالى لصفات كماله، ونعوت جلاله، وآيات جماله، "
          "والثناء عليه لإحسانه لعبده، وجميل فعاله به، مع حبه وتعظيمه تبارك وتعالى.",
          style: TextStyle(
            fontSize: 18,
            height: 1.8,
            fontFamily: "Amiri Quran",
          ),
        ),
      ),
    );
  }
}
