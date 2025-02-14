import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_app/modules/dashboard/providers/dashboard_screen_provider.dart';
import 'package:social_app/utils/enumerations/enumerations.dart';

class DashboardBodyWidget extends ConsumerStatefulWidget {
  const DashboardBodyWidget(
    this.pageController, {
    super.key,
  });

  final PageController pageController;

  @override
  ConsumerState<DashboardBodyWidget> createState() =>
      _DashboardBodyWidgetState();
}

class _DashboardBodyWidgetState extends ConsumerState<DashboardBodyWidget> {
  @override
  Widget build(BuildContext context) {
    final dashboardPageProviderVal = ref.watch(dashboardPageProvider);
    if (widget.pageController.hasClients) {
      widget.pageController.jumpToPage(
        dashboardPageProviderVal,
      );
    }

    return PageView(
      controller: widget.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: DashboardItems.values.map((item) => item.child).toList(),
    );
  }
}
