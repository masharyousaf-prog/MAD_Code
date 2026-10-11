import 'package:flutter/material.dart';
void main() => runApp(const ProfileScreen());

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Profile Screen",
      home: Scaffold(
        appBar: AppBar(title: Text("Profile Screen")),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  child: Image.asset(
                    "assests/images.png",
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text("Name: Ashar"),
              Text("Email: ashar7827@gmail.com"),
              Text("Gender: Male"),
            ],
          ),
        ),
      ),
    );
  }
}
