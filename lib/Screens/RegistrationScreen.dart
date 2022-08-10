import 'package:final_year_project_rider_app/Screens/loginscreen.dart';
import 'package:flutter/material.dart';

class RegistrationScreenn extends StatelessWidget {
  const RegistrationScreenn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Image(
                image: AssetImage("images/logo.png"),
                width: 500.0,
                height: 163.0,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 1.0,
              ),
              Text(
                "Sign Up as a Rider",
                style: TextStyle(fontSize: 25.0, fontFamily: "Brand Bold"),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 1.0,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Name",
                        labelStyle:
                            TextStyle(fontSize: 14.0, fontFamily: "Brand Bold"),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Phone",
                        labelStyle:
                            TextStyle(fontSize: 14.0, fontFamily: "Brand Bold"),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                      ),
                    ),
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
                        ),
                      ),
                      style:
                          TextStyle(fontSize: 14.0, fontFamily: "Brand Bold"),
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
                        ),
                      ),
                      style: TextStyle(fontSize: .0, fontFamily: "Brand Bold"),
                    ),
                    SizedBox(height: 10.0),
                    RaisedButton(
                        color: Colors.blueGrey,
                        textColor: Colors.white,
                        child: Container(
                          height: 50,
                          child: Center(
                            child: Text(
                              "Create Account",
                              style: TextStyle(
                                  fontSize: 18.0, fontFamily: "Brand Bold"),
                            ),
                          ),
                        ),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(24.0),
                        ),
                        onPressed: () {
                          print("Loggiedin button clicked");
                        }),
                  ],
                ),
              ),
              SizedBox(height: 1.0),
              FlatButton(
                  onPressed: () {
                    print("clicked");
                    LoginScreen();
                  },
                  child: Text(
                    "Already have an Account yet? Sign In",
                    style: TextStyle(fontSize: 15.0, fontFamily: "Brand Bold"),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
