// 来源：https://book.flutterchina.club/chapter5/transform.html
// 功能：演示 Transform 变换组件的使用，包括 Matrix4 倾斜、Translate 平移、
// Rotate 旋转、Scale 缩放，以及 RotatedBox 与 Transform.rotate 的区别。

import 'package:flutter/material.dart';

class TransformRoute extends StatelessWidget {
  const TransformRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        _SectionTitle(title: 'Matrix4.skewY 倾斜'),
        _SkewDemo(),
        _SectionTitle(title: 'Transform.translate 平移'),
        _TranslateDemo(),
        _SectionTitle(title: 'Transform.rotate 旋转'),
        _RotateDemo(),
        _SectionTitle(title: 'Transform.scale 缩放'),
        _ScaleDemo(),
        _SectionTitle(title: 'Transform 不影响布局（缩放后重叠）'),
        _TransformLayoutDemo(),
        _SectionTitle(title: 'RotatedBox（影响布局）'),
        _RotatedBoxDemo(),
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
      padding: const EdgeInsets.only(top: 20, left: 16, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _SkewDemo extends StatelessWidget {
  const _SkewDemo();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Transform(
        alignment: Alignment.topRight,
        transform: Matrix4.skewY(0.3),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.deepOrange,
          child: const Text(
            'Apartment for rent!',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class _TranslateDemo extends StatelessWidget {
  const _TranslateDemo();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      child: _TranslateChild(),
    );
  }
}

class _TranslateChild extends StatelessWidget {
  const _TranslateChild();

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(-20.0, -5.0),
      child: const Text("Hello world"),
    );
  }
}

class _RotateDemo extends StatelessWidget {
  const _RotateDemo();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      child: _RotateChild(),
    );
  }
}

class _RotateChild extends StatelessWidget {
  const _RotateChild();

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(angle: 1.57079632679, child: Text("Hello world"));
  }
}

class _ScaleDemo extends StatelessWidget {
  const _ScaleDemo();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      child: _ScaleChild(),
    );
  }
}

class _ScaleChild extends StatelessWidget {
  const _ScaleChild();

  @override
  Widget build(BuildContext context) {
    return Transform.scale(scale: 1.5, child: const Text("Hello world"));
  }
}

class _TransformLayoutDemo extends StatelessWidget {
  const _TransformLayoutDemo();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
          child: _ScaleChild(),
        ),
        const Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0)),
      ],
    );
  }
}

class _RotatedBoxDemo extends StatelessWidget {
  const _RotatedBoxDemo();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
          child: RotatedBox(quarterTurns: 1, child: Text("Hello world")),
        ),
        const Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0)),
      ],
    );
  }
}

void main() =>
    runApp(const MaterialApp(home: Scaffold(body: TransformRoute())));
