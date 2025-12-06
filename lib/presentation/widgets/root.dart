import 'package:flutter/material.dart';
import 'package:hisn_almuslim/presentation/screens/home_screen.dart';
import 'package:hisn_almuslim/presentation/screens/settings_screen.dart';
import 'package:hisn_almuslim/theme/app_colors.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({super.key});

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  PersistentTabController _controller = PersistentTabController();

  List<Widget> _buildScreens() {
    return [HomeScreen(), SettingsScreen()];
  }

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: [
        PersistentBottomNavBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: const Icon(FlutterIslamicIcons.solidQuran2, size: 30),
          ),
          inactiveIcon: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: const Icon(FlutterIslamicIcons.quran2, size: 30),
          ),
          title: "حِصْنُ المُسْلِم",
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            fontFamily: "Cairo",
          ),
          activeColorPrimary: Colors.teal.shade700,
          inactiveColorPrimary: Colors.grey,
        ),

        PersistentBottomNavBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Icon(Icons.settings, size: 30),
          ),
          inactiveIcon: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Icon(Icons.settings_outlined, size: 30),
          ),
          title: "الإِعْدَادَات",
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            fontFamily: "Cairo",
          ),
          activeColorPrimary: Colors.teal.shade700,
          inactiveColorPrimary: Colors.grey,
        ),
      ],
      decoration: NavBarDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(200),
          topRight: Radius.circular(200),
        ),
        colorBehindNavBar: isDark
            ? Colors.grey.shade900
            : AppColors.kPrimaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      backgroundColor: isDark ? Color(0xff2e2e2e) : Colors.white,
      navBarHeight: kBottomNavigationBarHeight + 8,
      navBarStyle: NavBarStyle.style14,
      confineToSafeArea: true,
      hideNavigationBarWhenKeyboardAppears: true,
      stateManagement: true,
      resizeToAvoidBottomInset: true,
    );
  }
}
