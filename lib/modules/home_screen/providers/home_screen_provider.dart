import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_app/models/feed/feed_res.dart';
import 'package:social_app/models/status/status_res.dart';

final statusListProvider = FutureProvider.autoDispose<List<StatusRes>>(
  (ref) async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
    final res = await rootBundle.loadString('assets/data/status_data.json');
    final statusRes = statusResFromJson(res);
    return statusRes;
  },
);

final feedListProvider = FutureProvider.autoDispose<List<FeedRes>>(
  (ref) async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
    final res = await rootBundle.loadString('assets/data/feed_data.json');
    final feedRes = feedResFromJson(res);
    return feedRes;
  },
);
