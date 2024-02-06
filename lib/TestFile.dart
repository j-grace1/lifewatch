import 'dart:async';

import 'package:flutter/material.dart';

class ProgressIndicatorExample extends StatefulWidget {
  const ProgressIndicatorExample({Key? key}) : super(key: key);

  @override
  _ProgressIndicatorExampleState createState() =>
      _ProgressIndicatorExampleState();
}

class _ProgressIndicatorExampleState extends State<ProgressIndicatorExample>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late DateTime nextUpdate;
  late Duration totalTime;

  @override
  void initState() {
    nextUpdate = _calculateNextUpdate();
    totalTime = nextUpdate.difference(DateTime.now());
    controller = AnimationController(
      vsync: this,
      duration: totalTime,
    )..addListener(() {
        setState(() {});
      });
    controller.reverse(from: 1.0);
    _startCountdownTimer();
    super.initState();
  }

  DateTime _calculateNextUpdate() {
    // Calculate the next update time, resetting at midnight
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day + 1); // Next midnight
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _startCountdownTimer() {
    const oneSecond = Duration(seconds: 1);
    Timer.periodic(oneSecond, (timer) {
      final currentTime = DateTime.now();
      if (currentTime.isAfter(nextUpdate)) {
        setState(() {
          nextUpdate = _calculateNextUpdate();
          totalTime = nextUpdate.difference(DateTime.now());
          controller.duration = totalTime;
          controller.reverse(from: 1.0);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Daily Count Down',
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),
            CircularProgressIndicator(
              value: controller.value,
              semanticsLabel: 'Circular progress indicator',
            ),
            SizedBox(
              height: 40,
            ),
            ..._calculateTimeUntilUpdate().map(
              (timeComponent) => Align(
                alignment: Alignment.center,
                child: Text(
                  timeComponent,
                  style: TextStyle(fontSize: 50),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> _calculateTimeUntilUpdate() {
    Duration timeUntilUpdate = nextUpdate.difference(DateTime.now());
    int hours = timeUntilUpdate.inHours;
    int minutes = (timeUntilUpdate.inMinutes % 60);
    int seconds = (timeUntilUpdate.inSeconds % 60);
    return ["$hours hours", "$minutes minutes", "$seconds seconds"];
  }
}
