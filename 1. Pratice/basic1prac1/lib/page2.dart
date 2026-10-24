import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});
  @override
  State<Page2> createState() => _Page2();
}

class _Page2 extends State<Page2> {
  final _formkey = GlobalKey<FormState>();
  String name = "";
  String roll = "";
  String email = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form task")),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formkey,
            child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Name",
                ),
                validator: (value) {
                  if(value == null){
                    return "Enter valid name";
                  }
                  return null;
                },
                onSaved: (value) => value != null? name = value : null,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Roll number",
                ),
                validator: (value) {
                  if(value == null){
                    return "Enter valid roll number";
                  }
                  return null;
                },
                onSaved: (value) => value != null? roll = value : null,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                ),
                validator: (value) {
                  if(value == null){
                    return "Enter valid email";
                  }
                  return null;
                },
                onSaved: (value) => value != null? email = value : null,
              ),
              ElevatedButton(onPressed: (){
                if(_formkey.currentState!.validate()){
                  _formkey.currentState!.save();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Name $name \n Roll no. $roll \n Email $email"))
                  );
                }
              }, child: Text("Submit"))
            ],
          )
          ),
        ),
      ),
    );
  }
}
