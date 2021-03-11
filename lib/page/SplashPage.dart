import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/json/SplashImageBean.dart';
import 'package:flutter_application/net/HttpManager.dart';
import 'package:flutter_application/widget/CountDownWidget.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SplashImageBean splashImageBean;
  String url = "";

  @override
  void initState() {
    getData().then((value) => {
          splashImageBean = SplashImageBean.fromJson(jsonDecode(value)),
          url = splashImageBean.data.url,
          if (url.isNotEmpty) {setState(() {})}
        });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topRight,
        children: [
          SplashImage(url: url),
          Padding(
            padding: EdgeInsets.only(right: 30.0, top: 30.0),
            child: CountDownWidget(),
          ),
        ],
      ),
    );
  }

  Future<String> getData() async {
    Response response;
    Dio dio = HttpManager.instance.dio;
    try {
      response = await dio.get("https://bing.ioliu.cn/v1/rand?type=json");
    } on DioError catch (e) {
      print(e);
    }
    return response.toString();
  }
}

class SplashImage extends StatefulWidget {
  String url;
  SplashImage({Key key, this.url}) : super(key: key);

  @override
  _SplashImageState createState() => _SplashImageState();
}

class _SplashImageState extends State<SplashImage> {
  @override
  Widget build(BuildContext context) {
    saveUrl();
    return Container(
      child: widget.url != null && widget.url.isNotEmpty
          ? FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: widget.url,
            )
          : null,
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
    );
  }

  void saveUrl() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('url', widget.url);
    var url = sharedPreferences.getString('url');
  }
}
