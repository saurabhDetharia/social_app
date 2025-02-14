import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_app/modules/home_screen/providers/home_screen_provider.dart';
import 'package:social_app/utils/extensions/extensions.dart';
import 'package:social_app/utils/extensions/number_format_extension.dart';
import 'package:social_app/values/values.dart';

class HomeScreenFeedsWidget extends ConsumerWidget {
  const HomeScreenFeedsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedListAsync = ref.watch(feedListProvider);

    return feedListAsync.when(
      data: (feeds) {
        return feeds.isEmpty
            ? SliverFillRemaining(
                fillOverscroll: true,
                child: Container(
                  height: 200,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Nothing new to see',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                      8.v,
                      const Text(
                        'You have watched all the updates. \nJump again after sometime.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              )
            : SliverList(
                delegate: SliverChildBuilderDelegate(
                  (buildContext, index) {
                    final feed = feeds[index];

                    return Container(
                      height: 300,
                      margin: padding24.copyWith(
                        bottom: 24 +
                            (index == (feeds.length - 1)
                                ? MediaQuery.of(context).padding.bottom
                                : 0),
                      ),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: radius20,
                        color: appDisabledColorLight,
                        boxShadow: const [
                          BoxShadow(
                            color: appShadowColorLight,
                            blurRadius: 20,
                          )
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: radius20,
                            child: Image.network(
                              feed.post,
                              key: ObjectKey(feed),
                              height: 300,
                              width: double.maxFinite,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            height: 120,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              borderRadius: radius20,
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  appPrimaryColorLight,
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: padding12,
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: radius79,
                                  child: Image.network(
                                    feed.profileImage,
                                    height: 35,
                                    width: 35,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                12.h,
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        feed.userName,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: appFontSecondaryColorLight,
                                        ),
                                      ),
                                      Text(
                                        feed.time.toString(),
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: appFontSecondaryColorLight,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                12.h,
                                const Icon(
                                  CupertinoIcons.ellipsis_vertical,
                                  color: appFontSecondaryColorLight,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 8,
                            left: 8,
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: radius20,
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 10,
                                      sigmaY: 10,
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: appSecondaryColorLight
                                            .withOpacity(0.3),
                                        borderRadius: radius20,
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            feed.isLiked
                                                ? CupertinoIcons.heart_fill
                                                : CupertinoIcons.heart,
                                            color: feed.isLiked
                                                ? appRedColor
                                                : appSecondaryColorLight,
                                          ),
                                          4.h,
                                          Text(
                                            feed.likes.counts,
                                            style: TextStyle(
                                              color: appSecondaryColorLight,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                12.h,
                                ClipRRect(
                                  borderRadius: radius20,
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 10,
                                      sigmaY: 10,
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: appSecondaryColorLight
                                            .withOpacity(0.3),
                                        borderRadius: radius20,
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            CupertinoIcons.chat_bubble,
                                            color: appSecondaryColorLight,
                                          ),
                                          4.h,
                                          Text(
                                            feed.comments.counts,
                                            style: TextStyle(
                                              color: appSecondaryColorLight,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                12.h,
                                ClipRRect(
                                  borderRadius: radius20,
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 10,
                                      sigmaY: 10,
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: appSecondaryColorLight
                                            .withOpacity(0.3),
                                        borderRadius: radius20,
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            CupertinoIcons.bookmark,
                                            color: appSecondaryColorLight,
                                          ),
                                          4.h,
                                          Text(
                                            feed.bookmarks.counts,
                                            style: TextStyle(
                                              color: appSecondaryColorLight,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: feeds.length,
                ),
                // },
                // separatorBuilder: (separatorBuilderCtx, index) {
                //   return 32.v;
                // },
                // itemCount: feeds.length,
              );
      },
      error: (error, stack) {
        return SliverFillRemaining(
          fillOverscroll: true,
          child: Container(
            height: 200,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Nothing new to see',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                  ),
                ),
                8.v,
                const Text(
                  'You have watched all the updates. \nJump again after sometime.',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
      loading: () {
        return SliverList(
          // padding: padding24v,
          // shrinkWrap: true,
          delegate: SliverChildBuilderDelegate(
            childCount: 10,
            (itemBuilderCtx, index) {
              return Container(
                height: 300,
                width: double.maxFinite,
                margin: padding24.copyWith(
                  bottom: 24 +
                      (index == 9 ? MediaQuery.of(context).padding.bottom : 0),
                ),
                decoration: BoxDecoration(
                  borderRadius: radius20,
                  color: appDisabledColorLight,
                ),
                alignment: Alignment.center,
                child: Icon(
                  CupertinoIcons.photo,
                  color: appPrimaryColorLight.withAlpha(20),
                ),
              );
            },
            // separatorBuilder: (separatorBuilderCtx, index) {
            //   return 32.v;
            // },
            // itemCount: 10,
          ),
        );
      },
    );
  }
}
