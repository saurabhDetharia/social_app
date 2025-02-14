import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_app/modules/home_screen/providers/home_screen_provider.dart';
import 'package:social_app/utils/extensions/sized_box.dart';
import 'package:social_app/values/values.dart';

class HomeScreenStatusList extends ConsumerWidget {
  const HomeScreenStatusList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusListAsync = ref.watch(statusListProvider);
    print('StatusList');

    return statusListAsync.when(
      data: (statusList) {
        return SliverToBoxAdapter(
          child: SizedBox(
            height: 60,
            child: ListView.separated(
              shrinkWrap: true,
              padding: padding24h,
              scrollDirection: Axis.horizontal,
              itemBuilder: (itemBuilderCtx, index) {
                return Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const RadialGradient(
                        colors: [
                          appGradientSecondaryColorLight,
                          appGradientPrimaryColorLight,
                        ],
                      ),
                      border: Border.all(
                        color: appSecondaryColorLight,
                      )),
                  child: index == 0
                      ? const Icon(
                          CupertinoIcons.add,
                          color: appPrimaryColorLight,
                        )
                      : ClipRRect(
                          borderRadius: radius35,
                          child: Image.network(
                            statusList[index - 1].profileImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                );
              },
              separatorBuilder: (separatorBuilderCtx, index) {
                return 20.h;
              },
              itemCount: statusList.length + 1,
            ),
          ),
        );
      },
      error: (error, stack) {
        return SliverToBoxAdapter(
          child: SizedBox(
            height: 60,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (itemBuilderCtx, index) {
                return Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const RadialGradient(
                        colors: [
                          appGradientSecondaryColorLight,
                          appGradientPrimaryColorLight,
                        ],
                      ),
                      border: Border.all(
                        color: appSecondaryColorLight,
                      )),
                  child: const Icon(
                    CupertinoIcons.add,
                    color: appPrimaryColorLight,
                  ),
                );
              },
              separatorBuilder: (separatorBuilderCtx, index) {
                return 20.h;
              },
              itemCount: 1,
            ),
          ),
        );
      },
      loading: () {
        return SliverToBoxAdapter(
          child: SizedBox(
            height: 60,
            child: ListView.separated(
              shrinkWrap: true,
              padding: padding24h,
              scrollDirection: Axis.horizontal,
              itemBuilder: (itemBuilderCtx, index) {
                return Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: index == 0
                          ? const RadialGradient(
                              colors: [
                                appGradientSecondaryColorLight,
                                appGradientPrimaryColorLight,
                              ],
                            )
                          : null,
                      color: index != 0 ? appDisabledColorLight : null,
                      border: Border.all(
                        color: appSecondaryColorLight,
                      )),
                  child: index == 0
                      ? const Icon(
                          CupertinoIcons.add,
                          color: appPrimaryColorLight,
                        )
                      : Icon(
                          CupertinoIcons.photo,
                          color: appPrimaryColorLight.withAlpha(20),
                        ),
                );
              },
              separatorBuilder: (separatorBuilderCtx, index) {
                return 20.h;
              },
              itemCount: 11,
            ),
          ),
        );
      },
    );
  }
}
