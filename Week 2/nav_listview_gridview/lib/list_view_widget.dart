import 'package:flutter/material.dart';

class ListViewEWidget extends StatelessWidget {
  const ListViewEWidget({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> Items = List.generate(10, (index) => 'Item ${index + 1}');
    return Scaffold(
      appBar: AppBar(title: Text('List View')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: .start,
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: Items.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      leading: Icon(Icons.add_shopping_cart),
                      title: Text(Items[index]),
                      subtitle: Text('This is ${Items[index]}'),
                      trailing: Icon(Icons.close),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('You tapped on ${Items[index]}'),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/grid');
              },
              child: Text('Grid View'),
            ),
          ],
        ),
      ),
    );
  }
}
