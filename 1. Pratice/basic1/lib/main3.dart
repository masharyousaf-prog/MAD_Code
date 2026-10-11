import "package:flutter/material.dart";

class Main3 extends StatelessWidget {
  const Main3({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scrollview page")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: 200,
                      width: 300,
                      color: Colors.greenAccent,
                      margin: EdgeInsets.only(right: 10),
                    ),
                    Container(
                      height: 200,
                      width: 300,
                      color: Colors.yellowAccent,
                      margin: EdgeInsets.only(right: 10),
                    ),
                    Container(
                      height: 200,
                      width: 300,
                      color: Colors.pinkAccent,
                      margin: EdgeInsets.only(right: 10),
                    ),
                    Container(
                      height: 200,
                      width: 300,
                      color: Colors.redAccent,
                      margin: EdgeInsets.only(right: 10),
                    ),
                    Container(
                      height: 200,
                      width: 300,
                      color: Colors.blueAccent,
                      margin: EdgeInsets.only(right: 10),
                    ),
                  ],
                ),
              ),
              Container(
                height: 200,
                color: Colors.redAccent,
                margin: EdgeInsets.only(bottom: 10,top: 10),
                
              ),
              Container(
                height: 200,
                color: Colors.blueAccent,
                margin: EdgeInsets.only(bottom: 10),
              ),
              Container(
                height: 200,
                color: Colors.yellowAccent,
                margin: EdgeInsets.only(bottom: 10),
              ),
              Container(
                height: 200,
                color: Colors.pinkAccent,
                margin: EdgeInsets.only(bottom: 10),
              ),
              Container(
                height: 200,
                color: Colors.redAccent,
                margin: EdgeInsets.only(bottom: 10),
              ),
              Container(
                height: 200,
                color: Colors.blueAccent,
                margin: EdgeInsets.only(bottom: 10),
              ),
              Container(
                height: 200,
                color: Colors.yellowAccent,
                margin: EdgeInsets.only(bottom: 10),
              ),
              Container(
                height: 200,
                color: Colors.pinkAccent,
                margin: EdgeInsets.only(bottom: 10),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/main4");
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
