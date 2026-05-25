// 来源：https://book.flutterchina.club/chapter5/container.html
// 功能：演示 Container 组合容器的使用，包括装饰+变换+约束的综合示例，
// 以及 Container 中 margin 和 padding 的区别对比。

import 'package:flutter/material.dart';

class ContainerRoute extends StatelessWidget {
  const ContainerRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        _SectionTitle(title: 'Container 综合示例（渐变背景 + 阴影 + 旋转）'),
        _CardDemo(),
        _SectionTitle(title: 'Container margin 示例'),
        _MarginDemo(),
        _SectionTitle(title: 'Container padding 示例'),
        _PaddingDemo(),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 16, bottom: 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _CardDemo extends StatelessWidget {
  const _CardDemo();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50.0, left: 120.0),
      constraints: const BoxConstraints.tightFor(width: 200.0, height: 150.0),
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          colors: [Colors.red, Colors.orange],
          center: Alignment.topLeft,
          radius: .98,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(2.0, 2.0),
            blurRadius: 4.0,
          ),
        ],
      ),
      transform: Matrix4.rotationZ(.2),
      alignment: Alignment.center,
      child: const Text(
        "5.20",
        style: TextStyle(color: Colors.white, fontSize: 40.0),
      ),
    );
  }
}

class _MarginDemo extends StatelessWidget {
  const _MarginDemo();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Container(
        margin: const EdgeInsets.all(20.0),
        color: Colors.orange,
        child: const Text("Hello world!"),
      ),
    );
  }
}

class _PaddingDemo extends StatelessWidget {
  const _PaddingDemo();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        color: Colors.orange,
        child: const Text("Hello world!"),
      ),
    );
  }
}

void main() =>
    runApp(const MaterialApp(home: Scaffold(body: ContainerRoute())));
