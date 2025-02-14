import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_app/modules/widgets/widgets.dart';

class ChatListScreen extends ConsumerWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('This ChatList');
    return Stack(
      children: [
        Positioned(
          top: 292,
          left: -100,
          child: BackgroundSquareWidget(
            angle: pi / 4,
            size: Size(
              470,
              680,
            ),
          ),
        ),
      ],
    );
  }
}
