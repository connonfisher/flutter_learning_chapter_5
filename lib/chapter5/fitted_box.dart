// 来源：https://book.flutterchina.club/chapter5/fittedbox.html
// 功能：演示 FittedBox 空间适配组件的使用，包括 BoxFit.none/BoxFit.contain
// 的区别、ClipRect 裁剪溢出、以及自定义 SingleLineFittedBox 单行缩放布局。

import 'package:flutter/material.dart';

class FittedBoxRoute extends StatelessWidget {
  const FittedBoxRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children:
            <Widget>[
                  _wContainer(BoxFit.none),
                  const Text('Wendux'),
                  _wContainer(BoxFit.contain),
                  const Text('Flutter中国'),
                  const SizedBox(height: 24),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('单行缩放布局示例'),
                  ),
                  wRow(' 90000000000000000 '),
                  FittedBox(child: wRow(' 90000000000000000 ')),
                  wRow(' 800 '),
                  SingleLineFittedBox(child: wRow(' 800 ')),
                  SingleLineFittedBox(child: wRow(' 90000000000000000 ')),
                ]
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: e,
                  ),
                )
                .toList(),
      ),
    );
  }
}

Widget _wContainer(BoxFit boxFit) {
  return Container(
    width: 50,
    height: 50,
    color: Colors.red,
    child: FittedBox(
      fit: boxFit,
      child: Container(width: 60, height: 70, color: Colors.blue),
    ),
  );
}

Widget wRow(String text) {
  Widget child = Text(text);
  child = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [child, child, child],
  );
  return child;
}

class SingleLineFittedBox extends StatelessWidget {
  final Widget? child;
  const SingleLineFittedBox({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return FittedBox(
          child: ConstrainedBox(
            constraints: constraints.copyWith(
              minWidth: constraints.maxWidth,
              maxWidth: double.infinity,
            ),
            child: child,
          ),
        );
      },
    );
  }
}

void main() =>
    runApp(const MaterialApp(home: Scaffold(body: FittedBoxRoute())));
