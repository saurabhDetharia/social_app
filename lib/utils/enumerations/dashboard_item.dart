import 'package:flutter/cupertino.dart';
import 'package:social_app/modules/chat/chat_list/chat_list_screen.dart';
import 'package:social_app/modules/favorite/favorites_list.dart';
import 'package:social_app/modules/home_screen/home_screen.dart';
import 'package:social_app/modules/profile/profile.dart';

enum DashboardItems {
  home(
    icon: CupertinoIcons.house,
    child: HomeScreen(),
  ),
  message(
    icon: CupertinoIcons.bubble_left_bubble_right,
    child: ChatListScreen(),
  ),
  middle(
    icon: CupertinoIcons.nosign,
    child: HomeScreen(),
  ),
  favorites(
    icon: CupertinoIcons.heart,
    child: FavoritesListScreen(),
  ),
  profile(
    icon: CupertinoIcons.profile_circled,
    child: ProfileScreen(),
  ),
  ;

  const DashboardItems({
    required this.icon,
    required this.child,
  });

  final Widget child;
  final IconData icon;
}
