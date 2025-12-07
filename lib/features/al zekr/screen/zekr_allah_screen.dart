import 'package:flutter/material.dart';
import 'package:hisn_almuslim/core/cubit/cubit/counter_cubit.dart';
import 'package:hisn_almuslim/features/al%20zekr/widgets/app_bar_zekr.dart';
import 'package:hisn_almuslim/features/al%20zekr/widgets/card_widget.dart';
import 'package:hisn_almuslim/features/al%20zekr/widgets/zekr_counter_build.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ZekrAllahScreen extends StatelessWidget {
  const ZekrAllahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: Scaffold(
        appBar: AppBarZekr(),
        body: Column(
          children: [
            /// Banner of Counter
            CardWidget(),

            /// Zekr Counter Build
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    // Gap(20),
                    ZekrCounterBuild(),

                    // Button to provide for user possible add zekr from user
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
