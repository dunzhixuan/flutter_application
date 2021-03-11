import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/page/HomePage.dart';
import 'package:flutter_application/page/SettingPage.dart';

class TabsPageState extends StatefulWidget {
  TabsPageState({Key key}) : super(key: key);

  @override
  _TabsPageStateState createState() => _TabsPageStateState();
}

class _TabsPageStateState extends State<TabsPageState> {
  int currentIndex = 0;

  List listTab = [HomePage(), SettingPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this.listTab[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this.currentIndex,
        iconSize: 30.0,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            this.currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "设置")
        ],
      ),
    );
  }
}
