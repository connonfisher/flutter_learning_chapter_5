// 来源：https://book.flutterchina.club/chapter5/decoratedbox.html
// 功能：演示 DecoratedBox 装饰容器的使用，结合 BoxDecoration 实现
// 渐变背景、圆角、阴影等装饰效果。

import 'package:flutter/material.dart';

class DecoratedBoxRoute extends StatelessWidget {
  const DecoratedBoxRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(2.0, 2.0),
              blurRadius: 4.0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
          child: Text("Login", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}

void main() =>
    runApp(const MaterialApp(home: Scaffold(body: DecoratedBoxRoute())));
