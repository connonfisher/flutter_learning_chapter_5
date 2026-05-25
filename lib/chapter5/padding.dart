// 来源：https://book.flutterchina.club/chapter5/padding.html
// 功能：演示 Padding 组件的使用，包括 EdgeInsets.all、EdgeInsets.only、
// EdgeInsets.symmetric、EdgeInsets.fromLTRB 四种填充方式。

import 'package:flutter/material.dart';

class PaddingRoute extends StatelessWidget {
  const PaddingRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text("Hello world"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text("I am Jack"),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Text("Your friend"),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(const MaterialApp(home: Scaffold(body: PaddingRoute())));
