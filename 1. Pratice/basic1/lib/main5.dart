import "package:flutter/material.dart";

class Main5 extends StatefulWidget {
  const Main5({super.key});
  @override
  State<Main5> createState() => _Main5();
}

class _Main5 extends State<Main5> {
  // var _email = "";
  // var _password = "";
  var _emailText = TextEditingController();
  var _passwordText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Center(
          child: Container(
            color: Colors.tealAccent,
            width: 200,
            height: 200,
            padding: EdgeInsets.all(7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  controller: _emailText,
                  decoration: InputDecoration(
                    labelText: "Enter Email",
                    hintText: "xyz@gmail.com",
                    prefixIcon: Icon(Icons.email),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 2, color: Colors.grey),
                    ),
                  ),
                ),
                TextFormField(
                  controller: _passwordText,
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    labelText: "Enter Password",
                    hintText: "",
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.remove_red_eye),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                  ),
                ),
                ElevatedButton(onPressed: (){
                  String uEmail = _emailText.text.toString();
                  String uPassword = _passwordText.text;
                  print("Email $uEmail, Password $uPassword");
                }, child: Text("Login"))
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context,"/main5");
      },
      child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
