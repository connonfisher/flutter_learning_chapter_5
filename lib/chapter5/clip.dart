// 来源：https://book.flutterchina.club/chapter5/clip.html
// 功能：演示 Clip 剪裁组件的使用，包括 ClipOval 圆角剪裁、ClipRRect 圆角矩形剪裁、
// ClipRect 溢出剪裁，以及 CustomClipper 自定义剪裁区域。

import 'package:flutter/material.dart';

class ClipRoute extends StatelessWidget {
  const ClipRoute({super.key});

  @override
  Widget build(BuildContext context) {
    Widget avatar = const FlutterLogo(size: 60);

    return Center(
      child: Column(
        children: <Widget>[
          avatar,
          ClipOval(child: avatar),
          ClipRRect(borderRadius: BorderRadius.circular(5.0), child: avatar),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                widthFactor: .5,
                child: avatar,
              ),
              const Text("你好世界", style: TextStyle(color: Colors.green)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRect(
                child: Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5,
                  child: avatar,
                ),
              ),
              const Text("你好世界", style: TextStyle(color: Colors.green)),
            ],
          ),
          const SizedBox(height: 16),
          DecoratedBox(
            decoration: const BoxDecoration(color: Colors.red),
            child: ClipRect(clipper: MyClipper(), child: avatar),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text('CustomClipper 剪裁 (10,15,40x30)'),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => const Rect.fromLTWH(10.0, 15.0, 40.0, 30.0);

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}

void main() => runApp(const MaterialApp(home: Scaffold(body: ClipRoute())));
