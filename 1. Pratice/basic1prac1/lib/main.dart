import 'package:flutter/material.dart';
import 'page2.dart';

main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Basic1 Prac1",
      initialRoute: '/',
      routes: {
      '/': (context) => Page1(), 
      '/page2': (context) => Page2()
      }
      );
  }
}

class Page1 extends StatefulWidget{
  const Page1({super.key});
  @override
  State<Page1> createState()=> _Page1();
}

class _Page1 extends State<Page1>{
  List<String> item= List.generate(10, (int index) => "Item $index");
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic1 prac1"),
      ),
      body: Padding(padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 500,
            height: 600,
            child: ListView.builder(
              itemCount: item.length,
              itemBuilder: (context, index){
                return Card(
                  elevation: 5,
                  child: ListTile(
                    leading: Icon(Icons.article),
                    title: Text(item[index]),
                    subtitle: Text("desccription of ${item[index]}"),
                  ),
                );
            }),
          )
        ],
      ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, '/page2');
      },
      child: Icon(Icons.arrow_forward),
      ),
    );
  }
}