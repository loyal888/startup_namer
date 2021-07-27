//引入material库
import 'package:flutter/material.dart';

//引入english_word
import 'package:english_words/english_words.dart';

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
      home: ExampleWidget(),
    );
  }
}

/// Stateful widgets 持有的状态可能在 widget 生命周期中发生变化，
/// 实现一个 stateful widget 至少需要两个类：
/// 1）一个 StatefulWidget 类；
/// 2）一个 State 类，
/// StatefulWidget 类本身是不变的，
/// 但是 State 类在 widget 生命周期中始终存在。
/// 快速生成widget快捷键为stful
class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  /// 保存建议的单词对
  final _suggestions = <WordPair>[];

  /// 增大字体大小
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StateFul Widget"),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // 对于每个建议的单词对都会调用一次 itemBuilder
        itemBuilder: (context, i) {
          // 在奇数行，该函数会添加一个分割线的 widget，来分隔相邻的词对。
          if (i.isOdd) {
            return const Divider();
          }
          // 语法 i ~/ 2 表示 i 除以 2，但返回值是整型（向下取整）,
          // 可以计算出 ListView 中减去分隔线后的实际单词对数量。
          final index = i ~/ 2;
          // 如果是建议列表中最后一个单词对，接着再生成10个单词对，然后添加到建议列表。
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}

/// 显示一个带有填充 (padding) 的简单 Widget
class ExampleWidget extends StatefulWidget {
  const ExampleWidget({Key? key}) : super(key: key);

  @override
  _ExampleWidgetState createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample App'),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.only(
                left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
          ),
          onPressed: () {},
          child: Text('Hello'),
        ),
      ),
    );
  }
}
