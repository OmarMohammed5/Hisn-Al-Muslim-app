import 'package:flutter/material.dart';
import 'package:hisn_almuslim/features/home/screen/home_screen.dart';
import 'package:hisn_almuslim/features/settings/screen/settings_screen.dart';
import 'package:hisn_almuslim/theme/app_colors.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
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
      padding: EdgeInsets.only(top: 2, bottom: 10),
      margin: EdgeInsets.only(bottom: 26, left: 50, right: 50),
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: [
        PersistentBottomNavBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: const Icon(Icons.home, size: 25),
          ),
          inactiveIcon: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Icon(Icons.home_outlined, size: 25),
          ),
          title: "الرئيسية",
          textStyle: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w800,
            fontFamily: "Cairo",
          ),
          activeColorPrimary: Color(0xffe7f7ec),
          inactiveColorPrimary: Colors.grey.shade400,
        ),

        PersistentBottomNavBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Icon(Icons.settings, size: 25),
          ),
          inactiveIcon: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Icon(Icons.settings_outlined, size: 25),
          ),
          title: "الاعدادات",
          textStyle: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w800,
            fontFamily: "Cairo",
          ),
          activeColorPrimary: Color(0xffe7f7ec),
          inactiveColorPrimary: Colors.grey.shade400,
        ),
      ],
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(20),
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
      backgroundColor: isDark ? Color(0xff00593d) : Color(0xff149f81),
      navBarHeight: kBottomNavigationBarHeight + 10,
      navBarStyle: NavBarStyle.style6,
      confineToSafeArea: true,
      hideNavigationBarWhenKeyboardAppears: true,
      stateManagement: true,
      resizeToAvoidBottomInset: true,
    );
  }
}
