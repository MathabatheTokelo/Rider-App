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
            height: 200.0,
            alignment: Alignment.center,
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
          Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(
                        fontSize: 14.0,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 10.0,
                      )),
                  style: TextStyle(fontSize: 14.0),
                ),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                        fontSize: 14.0,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 10.0,
                      )),
                  style: TextStyle(fontSize: 14.0),
                ),
              ])),
        ]));
  }
}
