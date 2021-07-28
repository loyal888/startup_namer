//引入material库
import 'package:flutter/material.dart';

/// 主函数（main）使用了 (=>) 符号，这是 Dart 中单行函数或方法的简写。
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  ///  widget 的主要工作是提供一个 build() 方法来描述如何根据其他较低级别的 widgets 来显示自己。
  /// 每次 MaterialApp 需要渲染时或者在 Flutter Inspector 中切换平台时 build 都会运行。
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "First Demo",
      // Scaffold 是 Material 库中提供的一个 widget，
      // 它提供了默认的导航栏、标题和包含主屏幕 widget 树的 body 属性。
      home: SampleApp(),
    );
  }
}

AnimationController? controller;
CurvedAnimation? curve;

/// 点击事件示例
class SampleApp extends StatefulWidget {
  @override
  _SampleAppState createState() => _SampleAppState();
}

class _SampleAppState extends State<SampleApp> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    curve = CurvedAnimation(
      parent: controller as Animation<double>,
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onDoubleTap: () {
            if (controller!.isCompleted) {
              controller?.reverse();
            } else {
              controller?.forward();
            }
          },
          child: RotationTransition(
            turns: curve as Animation<double>,
            child: FlutterLogo(
              size: 200.0,
            ),
          ),
        ),
      ),
    );
  }
}
