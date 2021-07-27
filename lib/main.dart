//引入material库
import 'package:flutter/material.dart';
//引入english_word
import 'package:english_words/english_words.dart';

// 主函数（main）使用了 (=>) 符号，这是 Dart 中单行函数或方法的简写。
void main() => runApp(MyApp());

// 该应用程序继承了 StatelessWidget，这将会使应用本身也成为一个 widget。
// Stateless widgets 是不可变的，这意味着它们的属性不能改变 —— 所有的值都是 final。
class MyApp extends StatelessWidget {
  //  widget 的主要工作是提供一个 build() 方法来描述如何根据其他较低级别的 widgets 来显示自己。
  // 每次 MaterialApp 需要渲染时或者在 Flutter Inspector 中切换平台时 build 都会运行。
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "First Demo",
      // Scaffold 是 Material 库中提供的一个 widget，
      // 它提供了默认的导航栏、标题和包含主屏幕 widget 树的 body 属性。
      home: Scaffold(
        appBar: AppBar(
          title: const Text("First Demo"),
        ),
        body:  Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}

// Stateful widgets 持有的状态可能在 widget 生命周期中发生变化，
// 实现一个 stateful widget 至少需要两个类：
// 1）一个 StatefulWidget 类；
// 2）一个 State 类，
// StatefulWidget 类本身是不变的，
// 但是 State 类在 widget 生命周期中始终存在。

// 快速生成widget快捷键为stful
class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }
}
