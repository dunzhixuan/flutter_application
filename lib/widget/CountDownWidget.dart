import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application/page/HomePage.dart';
import 'package:flutter_application/tabspagestate/TabsPageState.dart';

class CountDownWidget extends StatefulWidget {
  CountDownWidget({Key key}) : super(key: key);

  @override
  _CountDownWidgetState createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  Timer _timer;
  int countDown = 0;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      //自增
      countDown += 100;
      //到5s后停止
      if (countDown >= 5000) {
        _timer.cancel();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => TabsPageState()),
            (route) => route == null);
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: GestureDetector(
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              value: countDown / 5000,
            ),
            Text("${5 - (countDown ~/ 1000)}"),
          ],
        ),
        onTap: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
              (route) => route == null);
        },
      ),
    );
  }
}
