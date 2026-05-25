# Flutter 学习 · 第五章 容器类组件

基于 [《Flutter实战·第二版》第五章](https://book.flutterchina.club/chapter5/) 的完整示例代码，逐一验证每个小节的容器类 Widget 使用。

---

## 环境信息

| 项目 | 详情 |
|------|------|
| Flutter | 3.41.4 |
| Dart | 3.11.1 |
| 平台 | Android / iOS / Windows / Web |

## 快速开始

```bash
git clone https://github.com/connonfisher/flutter_learning_chapter_5.git
cd flutter_learning_chapter_5
flutter pub get
flutter run
```

## 项目结构

```
lib/
├── main.dart                     # 章节总目录导航（点击卡片进入各小节）
└── chapter5/
    ├── padding.dart              # 5.1 填充
    ├── decorated_box.dart        # 5.2 装饰容器
    ├── transform.dart            # 5.3 变换
    ├── container.dart            # 5.4 Container容器
    ├── clip.dart                 # 5.5 剪裁
    ├── fitted_box.dart           # 5.6 空间适配
    └── scaffold.dart             # 5.7 页面骨架
```

> 每个小节文件末尾均包含 `main()` 入口，可在 VS Code 中独立运行（`F5`）。

## 第五章目录

| 小节 | 标题 | 核心知识点 |
|------|------|-----------|
| 5.1 | 填充 | `EdgeInsets` 四种填充方式 |
| 5.2 | 装饰容器 | `BoxDecoration` 渐变/圆角/阴影 |
| 5.3 | 变换 | `Matrix4` / `translate` / `rotate` / `scale` / `RotatedBox` |
| 5.4 | Container容器 | `margin` / `padding` / `decoration` / `constraints` / `transform` |
| 5.5 | 剪裁 | `ClipOval` / `ClipRRect` / `ClipRect` / `CustomClipper` |
| 5.6 | 空间适配 | `FittedBox` / `BoxFit` / `SingleLineFittedBox` |
| 5.7 | 页面骨架 | `AppBar` / `Drawer` / `FAB` / `BottomNavigationBar` |
