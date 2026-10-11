import 'package:flutter/material.dart';

class Main2 extends StatefulWidget {
  const Main2({super.key});

  @override
  State<Main2> createState() => _Main2();
}

class _Main2 extends State<Main2> {
  Color _color = Colors.red;
  void _onTap() {
    setState(() {
      _color = Colors.blue;
    });
  }

  void _onDoubleTap() {
    setState(() {
      _color = Colors.green;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("row_column_inkwell")),
      body: Center(
        child: Container(
          height: 500,
          width: 250,
          color: Colors.yellow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("item1"),
              Text("item2"),
              Text("item3"),
              Text("item4"),
              ElevatedButton(
                onPressed: () {
                  print("Button pressed");
                },
                child: Text("Elevated button"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: _onTap,
                    onDoubleTap: _onDoubleTap,
                    child: Container(height: 200, width: 200, color: _color),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/main3");
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
