import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          SizedBox(
            height: 1.0,
          ),
          Image(
            image: AssetImage("images/logo.png"),
            width: 700.0,
            height: 400.0,
            alignment: Alignment.bottomCenter,
          ),
          SizedBox(
            height: 1.0,
          ),
          Text(
            "Login as a Rider",
            style: TextStyle(fontSize: 25.0, fontFamily: "Brand Bold"),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 1.0,
          ),
        ]));
  }
}
