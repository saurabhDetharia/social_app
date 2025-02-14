import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'status_res.freezed.dart';
part 'status_res.g.dart';

List<StatusRes> statusResFromJson(String str) =>
    List<StatusRes>.from(json.decode(str).map((x) => StatusRes.fromJson(x)));

String statusResToJson(List<StatusRes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class StatusRes with _$StatusRes {
  const factory StatusRes({
    required String userId,
    required String userHandle,
    required String userName,
    required String profileImage,
    required String statusImageUrl,
  }) = _StatusRes;

  factory StatusRes.fromJson(Map<String, dynamic> json) =>
      _$StatusResFromJson(json);

  const StatusRes._();
}
