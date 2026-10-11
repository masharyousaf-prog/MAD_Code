import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Form Example",
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text("User Data Form Example"))),
        body: Padding(padding: EdgeInsets.all(20), child: UserForm()),
      ),
    );
  }
}

class UserForm extends StatefulWidget {
  const UserForm({super.key});
  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _email = "";
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: .start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              hintText: "John Doe",
              labelText: "Please input your name",
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Please enter a valid name";
              }
              return null;
            },
            onSaved: (value) => value != null ? _name = value : null,
          ),
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.email),
              hintText: "johndoe@email.com",
              labelText: "Please input your email",
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Please enter a valid email";
              }
              final EmailRegex = RegExp(
                "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}\$",
              );
              if (!EmailRegex.hasMatch(value)) {
                return "Please enter a valid email: johndoe@email.com";
              }
              return null;
            },
            onSaved: (value) => value != null ? _email = value : null,
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Thank you! $_name ($_email)")),
                );
              }
            },
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}
