import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../provider/bilibili_lottery_provider.dart';
import '../../component/error_dialog.dart';

class BiliBiliLottery extends StatelessWidget {
  const BiliBiliLottery({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: BiliBiliLotteryCard(),
    );
  }
}

class BiliBiliLotteryCard extends ConsumerWidget {
  const BiliBiliLotteryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(bilibiliLotteryProvider.notifier);
    final textController = TextEditingController();

    return LayoutBuilder(builder: (context, boxConstraints) {
      return SizedBox(
        width: boxConstraints.maxWidth > 600 ? 600 : boxConstraints.maxWidth,
        child: Card(
          margin: const EdgeInsets.all(12),
          shadowColor: Colors.black38,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(48)),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text('填写动态URL'),
                  subtitle: Form(
                      child: TextField(
                          controller: textController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'https://t.bilibili.com/123456789',
                          ))),
                ),
                _buildCheckbox('评论区抽奖', true, (_) {}),
                Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.start,
                    children: [
                      ...blackListStringMap.entries
                          .map((e) => Consumer(builder: (context, ref, child) {
                                final blackList = ref.watch(
                                    bilibiliLotteryProvider
                                        .select((value) => value.blackList));
                                return _buildCheckbox(
                                    '排除${e.value}', blackList.contains(e.key),
                                    (_) {
                                  notifier.updateBlackList(
                                    e.key,
                                  );
                                });
                              }))
                          .toList(),
                    ]),
                const SizedBox(height: 10),
                Align(
                    alignment: Alignment.center,
                    child: Consumer(builder: (context, ref, child) {
                      final isLoading = ref.watch(bilibiliLotteryProvider
                          .select((value) => value.isLoading));

                      return AnimatedCrossFade(
                          firstChild: ElevatedButton(
                              onPressed: () {
                                notifier.setUrl(textController.text);
                                notifier.fetchLottery();
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text('开始抽奖')),
                          secondChild: const ElevatedButton(
                            onPressed: null,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator()),
                            ),
                          ),
                          duration: const Duration(seconds: 1),
                          crossFadeState: isLoading
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst);
                    })),
                const SizedBox(height: 10),
                Consumer(
                  builder: (context, ref, child) {
                    final lotteryState = ref.watch(lotteryProvider);
                    lotteryState.when(data: (data) {
                      showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.error(
                          message: '抽奖结果: ${data[0].toRawJson()}',
                        ),
                      );
                      return;
                    }, error: (error, stackTrace) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        showSnackBarOnError(context, error, stackTrace);
                      });
                      return;
                    }, loading: () {
                      return;
                    });
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildCheckbox(String text, bool value, Function(bool?)? onChanged) {
    return Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 5),
            child: SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                value: value,
                onChanged: onChanged,
              ),
            ),
          ),
          Text(text),
        ]);
  }
}
