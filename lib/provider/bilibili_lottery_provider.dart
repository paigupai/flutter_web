import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Repository/replies_detail_repository.dart';
import '../Repository/web_dynamic_detail_repository.dart';
import '../model/platform_exception.dart';
import '../model/replies_detail.dart';
import '../model/web_dynamic_detail.dart';
import '../viewModel/bilibili_lottery_view_model.dart';

enum LotteryBlacklistType {
  lotteryDog,
  genshinImpactPlayer,
  arknightsPlayer,
}

Map<LotteryBlacklistType, String> blackListStringMap = {
  LotteryBlacklistType.lotteryDog: '抽奖狗',
  LotteryBlacklistType.genshinImpactPlayer: '原神玩家',
  LotteryBlacklistType.arknightsPlayer: '明日方舟玩家',
};

class BiliBiliLotteryNotifier extends StateNotifier<BiliBiliLotteryViewModel> {
  BiliBiliLotteryNotifier()
      : super(const BiliBiliLotteryViewModel(url: '', blackList: []));

  final streamController = StreamController<List<Reply>>();

  void setUrl(String url) {
    state = state.copyWith(url: url);
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void updateBlackList(LotteryBlacklistType type) {
    List<LotteryBlacklistType> blackList = [];
    blackList.addAll(state.blackList);
    if (blackList.contains(type)) {
      blackList.remove(type);
    } else {
      blackList.add(type);
    }
    state = state.copyWith(blackList: blackList);
  }

  void fetchLottery() async {
    setLoading(true);
    try {
      await fetchLotteryData();
    } catch (e, s) {
      streamController.addError(e, s);
    }
    setLoading(false);
  }

  Future<void> fetchLotteryData() async {
    if (state.url.isEmpty) {
      throw const PlatformException('URL为空, 请填写URL',
          detail: 'url is empty, please input url');
    }
    final id = Uri.parse(state.url).pathSegments.last;
    try {
      int.parse(id);
    } catch (e) {
      throw const PlatformException('URL不正确, 请填写正确URL',
          detail: 'url is error, please input right url');
    }
    final WebDynamicDetail detail =
        await WebDynamicDetailRepository().fetchData(id);
    // 评论区的回复data
    final List<Reply> repliesList = [];
    if (detail.success) {
      int next = 1;
      while (true) {
        final RepliesDetail repliesDetail = await RepliesDetailRepository()
            .fetchData(
                oid: detail.commentIdStr!,
                type: detail.commentType!,
                next: next);
        if (repliesDetail.success) {
          repliesList.addAll(repliesDetail.repliesData.replies);
          // 小于20件，说明已经到底了
          if (repliesDetail.repliesData.replies.length < 20) {
            break;
          } else {
            next += 1;
          }
        } else {
          // 如果失败了，就直接退出
          break;
        }
      }
    }
    streamController.add(repliesList);
  }
}

final bilibiliLotteryProvider =
    StateNotifierProvider<BiliBiliLotteryNotifier, BiliBiliLotteryViewModel>(
        (ref) => BiliBiliLotteryNotifier());

final lotteryProvider = StreamProvider<List<Reply>>((ref) {
  final notifier = ref.watch(bilibiliLotteryProvider.notifier);
  ref.onDispose(notifier.streamController.close);
  return notifier.streamController.stream;
});
