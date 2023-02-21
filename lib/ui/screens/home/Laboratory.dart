import 'package:flutter/material.dart';

import '../../component/custom_card.dart';

class Laboratory extends StatelessWidget {
  const Laboratory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        title(context),
        warpContainer(),
      ],
    );
  }

  Widget title(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('实验室', style: Theme.of(context).textTheme.titleLarge),
          const Icon(Icons.science_outlined, size: 50, color: Colors.black12),
        ],
      ),
    );
  }

  Widget warpContainer() {
    return Wrap(
      spacing: 50,
      children: const [
        CustomCard(
          leading: Icon(
            Icons.person_outline,
          ),
          title: "占位",
          subtitle: "占位占位占位",
        ),
        CustomCard(
          leading: Icon(
            Icons.person_outline,
          ),
          title: "占位",
          subtitle: "占位占位占位",
        ),
        CustomCard(
          leading: Icon(
            Icons.person_outline,
          ),
          title: "占位",
          subtitle: "占位占位占位",
        ),
      ],
    );
  }
}
