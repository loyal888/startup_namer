import 'package:flutter/material.dart';

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