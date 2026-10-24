import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counterprovider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: ((context) => Counterprovider()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Provider example", home: const Page1());
  }
}

class Page1 extends StatelessWidget{
  const Page1({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<Counterprovider>(
              builder: (context, provider, child){
                if(provider.isLoading){
                  return const CircularProgressIndicator();
                }
                return Column(
                  children: [
                    Text("Counter ${provider.counter}"),
                    child!,
                  ],
                );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  Provider.of<Counterprovider>(context, listen: false).increment();
                }, 
                child: Icon(Icons.add)),
                ElevatedButton(onPressed: (){
                  Provider.of<Counterprovider>(context, listen: false).decrement();
                }, 
                child: Icon(Icons.remove)),
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}