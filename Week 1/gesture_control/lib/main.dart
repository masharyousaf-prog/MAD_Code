import 'package:flutter/material.dart';

void main() => runApp(const GestureDetector());

class GestureDetector extends StatelessWidget {
  const GestureDetector({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gesture Detector",
      home: Scaffold(
        appBar: AppBar(title: Text("Gesture")),
        body: Center(child: const Gestures()),
      ),
    );
  }
}

class Gestures extends StatefulWidget {
  const Gestures({super.key});
  @override
  State<Gestures> createState() => _GestureState();
}

class _GestureState extends State<Gestures> {
  Color _color = Colors.red;
  String _eventString = "No event performed";
  void _onTap() {
    setState(() {
      _color = Colors.blue;
      _eventString = "You tapped";
    });
  }

  void _onDoubleTap() {
    setState(() {
      _color = Colors.green;
      _eventString = "You double tapped";
    });
  }

  void _onLongPress() {
    setState(() {
      _color = Colors.yellow;
      _eventString = "You long pressed";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: _onTap,
          onDoubleTap: _onDoubleTap,
          onLongPress: _onLongPress,
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(color: _color),
          ),
        ),
        Text("$_eventString", style: TextStyle(color: _color)),
      ],
    );
  }
}
