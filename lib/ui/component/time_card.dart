import 'dart:async';

import 'package:flutter/material.dart';

class TimeCard extends StatefulWidget {
  const TimeCard({Key? key}) : super(key: key);

  @override
  State<TimeCard> createState() => _TimeCardState();
}

class _TimeCardState extends State<TimeCard> {
  late String formattedTime;
  @override
  void initState() {
    super.initState();
    formattedTime = getFormattedTime();
    Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        formattedTime = getFormattedTime();
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 5,
          color: Colors.white,
        ),
        const SizedBox(
          height: 4,
        ),
        InkWell(
          child: Text(
              'flutter web lab\n'
              '© ${DateTime.now().year} paigupai',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall),
          onTap: () {},
        ),
        const Icon(
          Icons.access_time,
          size: 30,
          color: Colors.black,
        ),
        Text(formattedTime,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall),
        Container(
          width: 100,
          height: 5,
          color: Colors.white,
        ),
      ],
    );
  }

  String getFormattedTime() {
    final DateTime now = DateTime.now();
    final String formattedTime = '${now.year.toString().padLeft(4, '0')}'
        '-${now.month.toString().padLeft(2, '0')}'
        '-${now.day.toString().padLeft(2, '0')}\n'
        '${now.hour.toString().padLeft(2, '0')}'
        ':${now.minute.toString().padLeft(2, '0')}'
        ':${now.second.toString().padLeft(2, '0')}';
    return formattedTime;
  }
}
