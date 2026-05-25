import 'package:flutter/material.dart';

import 'chapter5/padding.dart';
import 'chapter5/decorated_box.dart';
import 'chapter5/transform.dart';
import 'chapter5/container.dart';
import 'chapter5/clip.dart';
import 'chapter5/fitted_box.dart';
import 'chapter5/scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 容器类组件学习',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const Chapter5Home(),
    );
  }
}

class Chapter5Home extends StatelessWidget {
  const Chapter5Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('第五章 容器类组件'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _ChapterCard(
            title: '5.1 填充（Padding）',
            subtitle: 'EdgeInsets · all · only · symmetric · fromLTRB',
            route: PaddingRoute(),
          ),
          _ChapterCard(
            title: '5.2 装饰容器（DecoratedBox）',
            subtitle: 'BoxDecoration · gradient · borderRadius · boxShadow',
            route: DecoratedBoxRoute(),
          ),
          _ChapterCard(
            title: '5.3 变换（Transform）',
            subtitle: 'Matrix4 · translate · rotate · scale · RotatedBox',
            route: TransformRoute(),
          ),
          _ChapterCard(
            title: '5.4 容器组件（Container）',
            subtitle: 'margin · padding · decoration · constraints · transform',
            route: ContainerRoute(),
          ),
          _ChapterCard(
            title: '5.5 剪裁（Clip）',
            subtitle: 'ClipOval · ClipRRect · ClipRect · CustomClipper',
            route: ClipRoute(),
          ),
          _ChapterCard(
            title: '5.6 空间适配（FittedBox）',
            subtitle: 'BoxFit · SingleLineFittedBox · ClipRect',
            route: FittedBoxRoute(),
          ),
          _ChapterCard(
            title: '5.7 页面骨架（Scaffold）',
            subtitle: 'AppBar · Drawer · FAB · BottomNavigationBar',
            route: ScaffoldRoute(),
          ),
        ],
      ),
    );
  }
}

class _ChapterCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget route;

  const _ChapterCard({
    required this.title,
    required this.subtitle,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 12),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => route),
          );
        },
      ),
    );
  }
}
