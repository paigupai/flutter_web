import 'package:flutter/cupertino.dart';

import '../provider/bilibili_lottery_provider.dart';

@immutable
class BiliBiliLotteryViewModel {
  final String url;
  final List<LotteryBlacklistType> blackList;
  final bool isLoading;
//<editor-fold desc="Data Methods">
  const BiliBiliLotteryViewModel({
    required this.url,
    required this.blackList,
    this.isLoading = false,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BiliBiliLotteryViewModel &&
          runtimeType == other.runtimeType &&
          url == other.url &&
          blackList == other.blackList);

  @override
  int get hashCode => url.hashCode ^ blackList.hashCode;

  @override
  String toString() {
    return 'BiliBiliLotteryState{ Url: $url, blackList: $blackList,}';
  }

  BiliBiliLotteryViewModel copyWith({
    String? url,
    List<LotteryBlacklistType>? blackList,
    bool? isLoading,
  }) {
    return BiliBiliLotteryViewModel(
      url: url ?? this.url,
      blackList: blackList ?? this.blackList,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Url': url,
      'blackList': blackList,
    };
  }

  factory BiliBiliLotteryViewModel.fromMap(Map<String, dynamic> map) {
    return BiliBiliLotteryViewModel(
      url: map['Url'] as String,
      blackList: map['blackList'] as List<LotteryBlacklistType>,
    );
  }
}
