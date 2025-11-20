import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hisn_almuslim/core/cubit/cubit/counter_cubit.dart';
import 'package:hisn_almuslim/presentation/widgets/app_bar_zekr.dart';
import 'package:hisn_almuslim/presentation/widgets/card_widget.dart';
import 'package:hisn_almuslim/presentation/widgets/zekr_counter_build.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ZekrAllahScreen extends StatelessWidget {
  const ZekrAllahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: Scaffold(
        appBar: AppBarZekr(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Gap(20),

              /// Banner of Counter
              CardWidget(),

              /// Zekr Counter Build
              ZekrCounterBuild(),
            ],
          ),
        ),
      ),
    );
  }
}
