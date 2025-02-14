import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app/modules/home_screen/widgets/home_screen_background.dart';
import 'package:social_app/modules/home_screen/widgets/home_screen_feeds.dart';
import 'package:social_app/modules/home_screen/widgets/home_screen_status_list.dart';
import 'package:social_app/utils/extensions/extensions.dart';
import 'package:social_app/values/app_colors.dart';
import 'package:social_app/values/app_strings.dart';
import 'package:social_app/values/app_values.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background
        const HomeScreenBackgroundWidget(),

        SafeArea(
          bottom: false,
          child: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              // App bar
              SliverAppBar(
                titleSpacing: 0,
                backgroundColor: Colors.transparent,
                title: Padding(
                  padding: padding24h,
                  child: Text(
                    appTitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                centerTitle: false,
                elevation: 0,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.bell_fill,
                      color: appPrimaryColorLight,
                    ),
                  ),
                  12.h,
                ],
              ),

              // Title
              SliverToBoxAdapter(
                child: Padding(
                  padding: padding24,
                  child: Text(
                    feedLabel,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),

              // Statuses list
              const HomeScreenStatusList(),

              // Feed list
              const HomeScreenFeedsWidget(),
            ],
          ),
        )
      ],
    );
  }
}
