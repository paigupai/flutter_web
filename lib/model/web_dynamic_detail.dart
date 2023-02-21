import 'dart:convert';

class WebDynamicDetail {
  final int code;
  final String message;
  final String? commentIdStr;
  final int? commentType;

//<editor-fold desc="Data Methods">
  const WebDynamicDetail({
    required this.code,
    required this.message,
    this.commentIdStr,
    this.commentType,
  });

  bool get success => code == 0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WebDynamicDetail &&
          runtimeType == other.runtimeType &&
          code == other.code &&
          message == other.message &&
          commentIdStr == other.commentIdStr &&
          commentType == other.commentType);

  @override
  int get hashCode =>
      code.hashCode ^
      message.hashCode ^
      commentIdStr.hashCode ^
      commentType.hashCode;

  @override
  String toString() {
    return 'WebDynamicDetail{ code: $code, message: $message, commentIdStr: $commentIdStr, commentType: $commentType,}';
  }

  WebDynamicDetail copyWith({
    int? code,
    String? message,
    String? commentIdStr,
    int? commentType,
  }) {
    return WebDynamicDetail(
      code: code ?? this.code,
      message: message ?? this.message,
      commentIdStr: commentIdStr ?? this.commentIdStr,
      commentType: commentType ?? this.commentType,
    );
  }

  factory WebDynamicDetail.fromRawJson(String str) =>
      WebDynamicDetail.fromJson(json.decode(str));

  factory WebDynamicDetail.fromJson(Map<String, dynamic> json) {
    dynamic basicJson = json["data"]["item"]["basic"];

    return WebDynamicDetail(
      code: json["code"],
      message: json["message"],
      commentIdStr: basicJson["comment_id_str"],
      commentType: basicJson["comment_type"],
    );
  }
}
