//引入material库
import 'package:flutter/material.dart';
import 'AddOrRemoveWidget.dart';
import 'FadeAppTest.dart';

/// 主函数（main）使用了 (=>) 符号，这是 Dart 中单行函数或方法的简写。
void main() => runApp(MyApp());

/// 该应用程序继承了 StatelessWidget，这将会使应用本身也成为一个 widget。
/// Stateless widgets 是不可变的，这意味着它们的属性不能改变 —— 所有的值都是 final。
class MyApp extends StatelessWidget {
  ///  widget 的主要工作是提供一个 build() 方法来描述如何根据其他较低级别的 widgets 来显示自己。
  /// 每次 MaterialApp 需要渲染时或者在 Flutter Inspector 中切换平台时 build 都会运行。
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "First Demo",
      // Scaffold 是 Material 库中提供的一个 widget，
      // 它提供了默认的导航栏、标题和包含主屏幕 widget 树的 body 属性。
      home: FadeAppTest(),
    );
  }
}