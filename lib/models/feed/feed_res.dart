import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_res.freezed.dart';
part 'feed_res.g.dart';

List<FeedRes> feedResFromJson(String str) =>
    List<FeedRes>.from(json.decode(str).map((x) => FeedRes.fromJson(x)));

String feedResToJson(List<FeedRes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class FeedRes with _$FeedRes {
  const factory FeedRes({
    @JsonKey(name: "userId") required String userId,
    @JsonKey(name: "userHandle") required String userHandle,
    @JsonKey(name: "userName") required String userName,
    @JsonKey(name: "profileImage") required String profileImage,
    @JsonKey(name: "time") required DateTime time,
    @JsonKey(name: "likes") required int likes,
    @JsonKey(name: "comments") required int comments,
    @JsonKey(name: "bookmarks") required int bookmarks,
    @JsonKey(name: "post") required String post,
    @JsonKey(name: "isLiked") required bool isLiked,
  }) = _FeedRes;

  factory FeedRes.fromJson(Map<String, dynamic> json) =>
      _$FeedResFromJson(json);
}
