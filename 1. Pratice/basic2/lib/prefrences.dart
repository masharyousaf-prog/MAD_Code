import 'package:flutter/material.dart';
import 'myprovider.dart';
import 'package:provider/provider.dart';

class PrefrencesClass extends StatelessWidget{
  const PrefrencesClass({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Prefrences"),
      ),
      body: Center(
        child: Column(
          children: [
            Consumer<Myprovider>(
              builder: (context, provider, child){
              return ElevatedButton(onPressed: (){
                provider.toggleTheme();
              }, 
              child: Text(provider.isLight? "Light theme": "Dark theme")
              );
            },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, '/sqf');
      },
      child: Icon(Icons.arrow_forward),
      ),
    );
  }
}