import "package:flutter/material.dart";

class Main4 extends StatefulWidget {
  const Main4({super.key});

  @override
  State<Main4> createState() => _Main4();
}

class _Main4 extends State<Main4> {
  List<String> items = List.generate(100, (index) => "Item ${index + 1}");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.add_shopping_cart_rounded),
                title: Text(items[index]),
                trailing: Icon(Icons.delete),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Clicked ${items[index]}")),
                  );
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, "/main5");
        },
        child: Icon(Icons.arrow_forward),
        ),
    );
  }
}
