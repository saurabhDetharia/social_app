import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_app/modules/dashboard/providers/dashboard_screen_provider.dart';
import 'package:social_app/utils/utils.dart';
import 'package:social_app/values/values.dart';

class BottomNavBarWidget extends ConsumerWidget {
  const BottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('This BottomNav');

    return Container(
      decoration: BoxDecoration(
        color: appBackgroundColorLight,
        borderRadius: radius35,
        boxShadow: const [
          BoxShadow(
            color: appShadowColorLight,
            blurRadius: 15,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: radius35,
        child: Padding(
          padding: padding12ltr,
          child: BottomNavigationBar(
            currentIndex: ref.watch(dashboardPageProvider),
            unselectedItemColor: appDisabledColorLight,
            selectedItemColor: appPrimaryColorLight,
            elevation: 0,
            enableFeedback: false,
            onTap: (newIndex) {
              ref.read(dashboardPageProvider.notifier).state = newIndex;
            },
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            items: DashboardItems.values.map<BottomNavigationBarItem>((item) {
              return BottomNavigationBarItem(
                key: Key(item.name),
                icon: item == DashboardItems.middle
                    ? const SizedBox()
                    : Icon(
                        item.icon,
                      ),
                label: '',
              );
            }).toList(),
            showUnselectedLabels: false,
            showSelectedLabels: false,
          ),
        ),
      ),
    );
  }
}
