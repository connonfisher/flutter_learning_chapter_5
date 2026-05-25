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

---

## 5.3 变换（Transform）

> 原文：[5.3 变换（Transform）](https://book.flutterchina.club/chapter5/transform.html)

### 功能介绍

| 知识点 | 说明 |
|--------|------|
| `Matrix4.skewY` | 沿 Y 轴倾斜变换 |
| `Transform.translate` | 平移变换（不影响布局） |
| `Transform.rotate` | 旋转变换（绘制阶段） |
| `Transform.scale` | 缩放变换（绘制阶段） |
| `RotatedBox` | 旋转变换（布局阶段，影响组件位置和大小） |

### 演示效果

| 代码 | 运行效果 |
|------|---------|
| ![5.3 代码](assets/演示截图/5.3%20变换-代码.png) | ![5.3 运行](assets/演示截图/5.3%20变换-运行效果.png) |

### 核心代码示例

**Matrix4.skewY —— 倾斜**

```dart
Container(
  color: Colors.black,
  child: Transform(
    alignment: Alignment.topRight,
    transform: Matrix4.skewY(0.3),
    child: Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.deepOrange,
      child: const Text('Apartment for rent!'),
    ),
  ),
)
```

**Transform.translate —— 平移**

```dart
DecoratedBox(
  decoration: BoxDecoration(color: Colors.red),
  child: Transform.translate(
    offset: const Offset(-20.0, -5.0),
    child: const Text("Hello world"),
  ),
)
```

**Transform.rotate —— 旋转**

```dart
DecoratedBox(
  decoration: BoxDecoration(color: Colors.red),
  child: Transform.rotate(
    angle: 1.57079632679, // π/2，旋转90度
    child: Text("Hello world"),
  ),
)
```

**Transform.scale —— 缩放**

```dart
DecoratedBox(
  decoration: BoxDecoration(color: Colors.red),
  child: Transform.scale(
    scale: 1.5,
    child: const Text("Hello world"),
  ),
)
```

**RotatedBox —— 布局阶段旋转（与 Transform.rotate 的区别）**

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      child: RotatedBox(
        quarterTurns: 1, // 旋转90度（1/4圈）
        child: Text("Hello world"),
      ),
    ),
    Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0)),
  ],
)
```

> 关键区别：`Transform.rotate` 在绘制阶段变换不影响布局空间；`RotatedBox` 在布局阶段变换，装饰和相邻组件会随之调整。

> 独立运行：在 VS Code 中打开 `lib/chapter5/transform.dart` 按 `F5`

---

## 5.4 容器组件（Container）

> 原文：[5.4 容器组件（Container）](https://book.flutterchina.club/chapter5/container.html)

### 功能介绍

| 知识点 | 说明 |
|--------|------|
| `Container` | `DecoratedBox` + `ConstrainedBox` + `Transform` + `Padding` + `Align` 的组合容器 |
| `margin` | 容器外部留白 |
| `padding` | 容器内部留白 |
| `decoration` | 背景装饰（渐变、阴影等） |
| `constraints` | 容器大小约束 |
| `transform` | 矩阵变换 |

### 演示效果

| 代码 | 运行效果 |
|------|---------|
| ![5.4 代码](assets/演示截图/5.4%20Container容器-代码.png) | ![5.4 运行](assets/演示截图/5.4%20Container容器-运行效果.png) |

### 核心代码示例

**Container 综合示例 —— 卡片（渐变 + 阴影 + 旋转）**

```dart
Container(
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
)
```

**margin —— 容器外部留白**

```dart
Container(
  margin: const EdgeInsets.all(20.0),
  color: Colors.orange,
  child: const Text("Hello world!"),
)
```

**padding —— 容器内部留白**

```dart
Container(
  padding: const EdgeInsets.all(20.0),
  color: Colors.orange,
  child: const Text("Hello world!"),
)
```

> `color` 和 `decoration` 互斥，不能同时设置。`margin` 在外、`padding` 在内，均通过 `Padding` 组件实现。

> 独立运行：在 VS Code 中打开 `lib/chapter5/container.dart` 按 `F5`

---

## 5.5 剪裁（Clip）

> 原文：[5.5 剪裁（Clip）](https://book.flutterchina.club/chapter5/clip.html)

### 功能介绍

| 知识点 | 说明 |
|--------|------|
| `ClipOval` | 剪裁为内贴圆形/椭圆 |
| `ClipRRect` | 剪裁为圆角矩形 |
| `ClipRect` | 剪裁溢出部分 |
| `ClipPath` | 按自定义路径剪裁 |
| `CustomClipper` | 自定义剪裁区域 |

### 演示效果

| 代码 | 运行效果 |
|------|---------|
| ![5.5 代码](assets/演示截图/5.5%20剪裁-代码.png) | ![5.5 运行](assets/演示截图/5.5%20剪裁-运行效果.png) |

### 核心代码示例

**ClipOval / ClipRRect / ClipRect**

```dart
Widget avatar = const FlutterLogo(size: 60);

avatar,                                                     // 原图
ClipOval(child: avatar),                                    // 圆形
ClipRRect(borderRadius: BorderRadius.circular(5.0), child: avatar), // 圆角矩形

Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    ClipRect(
      child: Align(
        alignment: Alignment.topLeft,
        widthFactor: .5,           // 宽度一半，溢出部分会被剪裁
        child: avatar,
      ),
    ),
    const Text("你好世界"),
  ],
)
```

**CustomClipper —— 自定义剪裁区域**

```dart
class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => const Rect.fromLTWH(10.0, 15.0, 40.0, 30.0);

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}

DecoratedBox(
  decoration: const BoxDecoration(color: Colors.red),
  child: ClipRect(clipper: MyClipper(), child: avatar),
)
```

> 剪裁发生在绘制阶段，不影响布局空间（与 `Transform` 同理）。`shouldReclip` 返回 `false` 可避免不必要的重新剪裁开销。

> 独立运行：在 VS Code 中打开 `lib/chapter5/clip.dart` 按 `F5`

---

## 5.6 空间适配（FittedBox）

> 原文：[5.6 空间适配（FittedBox）](https://book.flutterchina.club/chapter5/fittedbox.html)

### 功能介绍

| 知识点 | 说明 |
|--------|------|
| `FittedBox` | 子组件超出父容器时按比例缩放适配 |
| `BoxFit.none` | 不缩放，按真实大小绘制 |
| `BoxFit.contain` | 按比例缩放，尽可能占据父容器 |
| `SingleLineFittedBox` | 自定义单行缩放布局（minWidth + maxWidth 约束技巧） |

### 演示效果

| 代码 | 运行效果 |
|------|---------|
| ![5.6 代码](assets/演示截图/5.6%20空间适配-代码.png) | ![5.6 运行](assets/演示截图/5.6%20空间适配-运行效果.png) |

### 核心代码示例

**BoxFit.none vs BoxFit.contain**

```dart
Container(
  width: 50, height: 50, color: Colors.red,
  child: FittedBox(
    fit: BoxFit.none,  // 不缩放，蓝色会溢出红色区域
    child: Container(width: 60, height: 70, color: Colors.blue),
  ),
)

Container(
  width: 50, height: 50, color: Colors.red,
  child: FittedBox(
    fit: BoxFit.contain,  // 按比例缩放适配
    child: Container(width: 60, height: 70, color: Colors.blue),
  ),
)
```

**FittedBox 单行缩放布局**

```dart
FittedBox(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [child, child, child],
  ),
)
```

**SingleLineFittedBox —— 解决短文本缩在一起的问题**

```dart
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
              minWidth: constraints.maxWidth,   // 至少占满屏幕宽度
              maxWidth: double.infinity,         // 允许无限宽
            ),
            child: child,
          ),
        );
      },
    );
  }
}
```

> 关键：`FittedBox` 传给子组件的约束是无限大，导致 `Row` 宽度为子组件之和。通过 `LayoutBuilder` 获取屏幕宽度并设 `minWidth` 解决收缩问题。

> 独立运行：在 VS Code 中打开 `lib/chapter5/fitted_box.dart` 按 `F5`

---

## 5.7 页面骨架（Scaffold）

> 原文：[5.7 页面骨架（Scaffold）](https://book.flutterchina.club/chapter5/material_scaffold.html)

### 功能介绍

| 知识点 | 说明 |
|--------|------|
| `Scaffold` | Material Design 路由页骨架，拼装完整页面 |
| `AppBar` | 顶部导航栏（标题、按钮、阴影） |
| `Drawer` | 左右抽屉菜单（滑动/按钮打开） |
| `FloatingActionButton` | 悬浮操作按钮 |
| `BottomNavigationBar` | 底部 Tab 导航栏 |

### 演示效果

| 代码 | 运行效果 |
|------|---------|
| ![5.7 代码](assets/演示截图/5.7%20页面骨架-代码.png) | ![5.7 运行](assets/演示截图/5.7%20页面骨架-运行效果.png) |

### 核心代码示例

**Scaffold 完整页面**

```dart
Scaffold(
  appBar: AppBar(
    title: const Text("App Name"),
    actions: <Widget>[
      IconButton(icon: const Icon(Icons.share), onPressed: () {}),
    ],
  ),
  drawer: const MyDrawer(),
  bottomNavigationBar: BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
      BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
    ],
    currentIndex: _selectedIndex,
    fixedColor: Colors.blue,
    onTap: _onItemTapped,
  ),
  floatingActionButton: FloatingActionButton(
    onPressed: _onAdd,
    child: const Icon(Icons.add),
  ),
)
```

**Drawer 抽屉菜单**

```dart
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(child: FlutterLogo(size: 80)),
                  ),
                  Text("Wendux", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

> 独立运行：在 VS Code 中打开 `lib/chapter5/scaffold.dart` 按 `F5`
