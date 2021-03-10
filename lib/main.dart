import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/json/SplashImageBean.dart';
import 'package:flutter_application/page/SplashPage.dart';

import 'json/SplashImageBean.dart';
import 'page/HomePage.dart';

void main() {
  runApp(MyApp('Hello World'));
  if (Platform.isAndroid) {
    //设置Android头部的导航栏透明
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatefulWidget {
  String content;

  MyApp(this.content);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SplashImageBean splashImageBean;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage(),
      // routes: Routes().getRoutes(),
      routes: {
        'homepage': (context) => HomePage(),
        'splashpage': (context) => SplashPage(),
      },
    );
  }
}
