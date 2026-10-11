import 'package:flutter/material.dart';

class Main1 extends StatefulWidget {
  const Main1({super.key});

  @override
  State<Main1> createState() => _Main1();
}

class _Main1 extends State<Main1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("container_text_image_button")),
      body: Center(
          child: Container(
            height: 300,
            width: 300,
            padding: EdgeInsets.all(25),
            color: Colors.cyanAccent,
            child: Column(
              children: [
                Text(
                  "Basic styled text",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.blueAccent,
                    backgroundColor: Colors.white,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    print("Elevated button is pressed");
                  },
                  child: Text("Elevated Button"),
                ),
                SizedBox(height: 20),
                Container(
                  height: 50,
                  width: 50,
                  child: Image.asset("assests/images.png"),
                ),
              ],
            ),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/main2");
        },
        child: const Icon(Icons.arrow_forward),
      ),
      );
  }
}
