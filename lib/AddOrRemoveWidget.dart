import 'package:flutter/material.dart';

/// 在布局中添加或删除一个组件
class AddOrRemoveWidget extends StatefulWidget {
  AddOrRemoveWidget({Key? key}) : super(key: key);

  @override
  _AddOrRemoveWidgetState createState() => _AddOrRemoveWidgetState();
}

class _AddOrRemoveWidgetState extends State<AddOrRemoveWidget> {
  // Default value for toggle.
  bool toggle = true;
  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  Widget _getToggleChild() {
    if (toggle) {
      return Text('Toggle One');
    } else {
      return ElevatedButton(
        onPressed: () {},
        child: Text('Toggle Two'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample App'),
      ),
      body: Center(
        child: _getToggleChild(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'Update Text',
        child: Icon(Icons.update),
      ),
    );
  }
}