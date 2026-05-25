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

---

## 5.1 填充（Padding）

> 原文：[5.1 填充（Padding）](https://book.flutterchina.club/chapter5/padding.html)

### 功能介绍

| 知识点 | 说明 |
|--------|------|
| `Padding` | 给子节点添加填充（留白） |
| `EdgeInsets.all` | 所有方向相同数值填充 |
| `EdgeInsets.only` | 指定某个方向的填充 |
| `EdgeInsets.symmetric` | 对称方向填充（vertical / horizontal） |
| `EdgeInsets.fromLTRB` | 分别指定四个方向的填充 |

### 演示效果

| 代码 | 运行效果 |
|------|---------|
| ![5.1 代码](assets/演示截图/5.1%20填充-代码.png) | ![5.1 运行](assets/演示截图/5.1%20填充-运行效果.png) |

### 核心代码示例

**EdgeInsets.all —— 四边均等填充**

```dart
Padding(
  padding: const EdgeInsets.all(16),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const <Widget>[
      Padding(
        padding: EdgeInsets.only(left: 8),
        child: Text("Hello world"),
      ),
      // ...
    ],
  ),
)
```

**EdgeInsets.only —— 单侧填充**

```dart
Padding(
  padding: const EdgeInsets.only(left: 8),
  child: Text("Hello world"),
)
```

**EdgeInsets.symmetric —— 对称填充**

```dart
Padding(
  padding: const EdgeInsets.symmetric(vertical: 8),
  child: Text("I am Jack"),
)
```

**EdgeInsets.fromLTRB —— 四边分别指定**

```dart
Padding(
  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
  child: Text("Your friend"),
)
```

> 独立运行：`cd lib/chapter5 && dart run padding.dart` 或在 VS Code 中打开该文件按 `F5`

---

## 5.2 装饰容器（DecoratedBox）

> 原文：[5.2 装饰容器（DecoratedBox）](https://book.flutterchina.club/chapter5/decoratedbox.html)

### 功能介绍

| 知识点 | 说明 |
|--------|------|
| `DecoratedBox` | 在子组件绘制前/后绘制装饰 |
| `BoxDecoration` | 常用装饰类（颜色、边框、圆角、阴影、渐变） |
| `LinearGradient` | 线性渐变 |
| `BorderRadius` | 圆角半径 |
| `BoxShadow` | 阴影效果 |

### 演示效果

| 代码 | 运行效果 |
|------|---------|
| ![5.2 代码](assets/演示截图/5.2%20装饰容器-代码.png) | ![5.2 运行](assets/演示截图/5.2%20装饰容器-运行效果.png) |

### 核心代码示例

**DecoratedBox + BoxDecoration 渐变按钮**

```dart
DecoratedBox(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.red, Colors.orange],
    ),
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
    child: Text(
      "Login",
      style: TextStyle(color: Colors.white),
    ),
  ),
)
```

> 独立运行：在 VS Code 中打开 `lib/chapter5/decorated_box.dart` 按 `F5`
