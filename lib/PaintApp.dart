import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: PaintApp()));

/// 在 Flutter 中如何实现一个签名功能
class PaintApp extends StatelessWidget {
  Widget build(BuildContext context) => Scaffold(body: Signature());
}

class Signature extends StatefulWidget {
  SignatureState createState() => SignatureState();
}

class SignatureState extends State<Signature> {
  List<Offset> _points = <Offset>[];

  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          RenderBox? referenceBox = context.findRenderObject() as RenderBox?;
          Offset localPosition =
              referenceBox!.globalToLocal(details.globalPosition);
          // 级联运算符 (.., ?..) 可以让你在同一个对象上连续调用多个对象的变量或方法。
          _points = List.from(_points)..add(localPosition);
        });
      },
      onPanEnd: (DragEndDetails details) => {_points.add(Offset.zero)},
      child: CustomPaint(
        painter: SignaturePainter(_points),
        size: Size.infinite,
      ),
    );
  }
}

class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);

  final List<Offset> points;

  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != Offset.zero && points[i + 1] != Offset.zero)
        canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  bool shouldRepaint(SignaturePainter other) => other.points != points;
}
