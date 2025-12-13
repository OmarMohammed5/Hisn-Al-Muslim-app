import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hisn_almuslim/core/models/category_model.dart';
import 'package:hisn_almuslim/features/home/widgets/shimmer_skeleton.dart';
import 'package:hisn_almuslim/shared/app_bar_widget.dart';
import 'package:hisn_almuslim/features/home/widgets/banners_widget.dart';
import 'package:hisn_almuslim/features/home/widgets/custom_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Load Home Categories instance of using setState
  Future<bool> loadHomeData() async {
    await Future.delayed(Duration(seconds: 2));
    return true;
  }

  late Future<bool> _homeFuture;
  @override
  void initState() {
    super.initState();
    _homeFuture = loadHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "اَلأذْكَار اَليَومِيّة"),
      body: FutureBuilder(
        future: _homeFuture,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ShimmerSkeleton();
          }
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(children: [Gap(10), BannersWidget(), Gap(5)]),
              ),
              SliverPadding(
                padding: EdgeInsets.all(16),
                sliver: SliverGrid.builder(
                  itemCount: categories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 5.8 / 4,
                  ),
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return CustomCardWidget(
                      title: category.title,
                      icon: category.icon,
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => category.screen,
                            transitionDuration: const Duration(
                              milliseconds: 250,
                            ),
                            transitionsBuilder: (_, animation, __, child) {
                              final tween = Tween(
                                begin: const Offset(1, 0),
                                end: Offset.zero,
                              ).chain(CurveTween(curve: Curves.easeOut));

                              return SlideTransition(
                                position: animation.drive(tween),
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
