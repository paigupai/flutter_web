import 'package:flutter/material.dart';

import 'animated_press.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.title,
    required this.subtitle,
    required this.leading,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  /// 标题
  final String title;

  /// 描述
  final String subtitle;

  /// 图标
  final Widget leading;

  /// 点击打开触发
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      return AnimatedPress(
        scaleEnd: 0.95,
        child: SizedBox(
          width: boxConstraints.maxWidth > 400 ? 400 : boxConstraints.maxWidth,
          child: Card(
            margin: const EdgeInsets.only(top: 12, bottom: 12),
            shadowColor: Colors.black38,
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(48)),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                children: [
                  ListTile(
                    leading: leading,
                    title: Text(title,
                        style: Theme.of(context).textTheme.titleMedium),
                    subtitle: Text(subtitle,
                        style: Theme.of(context).textTheme.titleSmall),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: onPressed,
                        child: Text('打开',
                            style: Theme.of(context).textTheme.bodyMedium),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
