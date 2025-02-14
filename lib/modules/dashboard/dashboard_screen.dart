import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_app/modules/dashboard/widgets/bottom_nav_bar.dart';
import 'package:social_app/modules/dashboard/widgets/dashboard_body.dart';
import 'package:social_app/modules/widgets/square_button/square_button.dart';
import 'package:social_app/values/app_colors.dart';
import 'package:social_app/values/app_values.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  final pageController = PageController(
    keepPage: false,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: appBackgroundColorLight,
      body: DashboardBodyWidget(pageController),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: SquareButtonWidget(
          size: const Size(60, 60),
          borderRadius: radius23,
          child: const Icon(
            size: 24,
            CupertinoIcons.add_circled,
            color: appSecondaryColorLight,
          ),
          onTap: () {},
        ),
      ),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
