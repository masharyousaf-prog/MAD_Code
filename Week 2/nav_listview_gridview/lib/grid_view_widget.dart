import 'package:flutter/material.dart';
class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> Items = List.generate(
      10,
      (index) => {
        'id': index,
        'name': "Item ${index + 1}",
        'color': Colors.green[(index % 9 + 1) * 100],},
    );
    return Scaffold(
      appBar: AppBar(title: Text('Grid View')),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.0,
                ),
                itemCount: Items.length,
                itemBuilder: (context, index) {
                  final item = Items[index];
                  return Card(
                    elevation: 2,
                    color: item['color'],
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('You tapped on ${item['name']}'),
                            ),
                          );
                        },
                        child: Center(
                          child: Text(
                            item['name'],
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back to List View'),
            ),
          ],
        ),
      ),
    );
  }
}
