import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hisn_almuslim/core/cubit/cubit/counter_cubit.dart';
import 'package:hisn_almuslim/theme/app_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({super.key});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  int savedTotal = 0;
  bool prefsLoaded = false;

  @override
  void initState() {
    super.initState();
    // wait for first frame so context and provider are ready
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadCounter());
  }

  ///  Method to save value
  Future<void> _saveCounter(int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("totalCount", value);
  }

  //// To return value when the user open your app agian
  Future<void> _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getInt("totalCount") ?? 0;
    setState(() {
      savedTotal = stored;
      prefsLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocListener<CounterCubit, Map<int, int>>(
      listener: (context, state) async {
        final totalCount = state.values.fold(0, (sum, count) => sum + count);
        // save each time cubit changes
        await _saveCounter(totalCount + savedTotal);
      },
      child: BlocBuilder<CounterCubit, Map<int, int>>(
        builder: (context, state) {
          final totalCount = state.values.fold(0, (sum, count) => sum + count);

          /// Saved Old Value  + Adding New Value
          final displayTotal = totalCount + savedTotal;

          return SizedBox(
            height: 220,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              color: isDark ? Colors.grey[850] : Colors.white,
              margin: const EdgeInsets.all(12),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  // Row doesn't have 'spacing' property; use SizedBox between children instead
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "قال تعالى\n"
                        "﴿ وَمَن أَعْرَضَ عَن ذِكْرِي فَإِنَّ لَهُ مَعِيشَةً ضَنكًا "
                        " وَنَحْشُرُهُ يَوْمَ الْقِيَامَةِ أَعْمَى ﴾\n"
                        "صدق الله العظيم",
                        textAlign: TextAlign.right,
                        maxLines: 6,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          height: 1.6,
                          fontFamily: "Amiri Quran",
                        ),
                      ),
                    ),
                    Gap(20),
                    Container(
                      width: 120,
                      height: 125,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.teal, width: 4),
                      ),
                      child: Center(
                        child: AppText(
                          "$displayTotal",
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
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
}
