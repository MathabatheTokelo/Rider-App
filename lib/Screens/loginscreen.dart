import 'package:final_year_project_rider_app/Screens/RegistrationScreen.dart';
import 'package:final_year_project_rider_app/Screens/mainscreen.dart';
import 'package:final_year_project_rider_app/Widgets/progressDialog.dart';
import 'package:final_year_project_rider_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatelessWidget {
  static const String idScreen = "login";
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  LoginScreen({Key? key}) : super(key: key);

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
                "Login as a Rider",
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
                      controller: emailTextEditingController,
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
                      controller: passwordTextEditingController,
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
                      style:
                          TextStyle(fontSize: 14.0, fontFamily: "Brand Bold"),
                    ),
                    SizedBox(height: 10.0),
                    RaisedButton(
                        color: Colors.blueGrey,
                        textColor: Colors.white,
                        child: Container(
                          height: 50,
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 18.0, fontFamily: "Brand Bold"),
                            ),
                          ),
                        ),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(24.0),
                        ),
                        onPressed: () {
                          if (!emailTextEditingController.text.contains("@")) {
                            displayToastMessage(
                                "Email address not valid", context);
                          } else if (passwordTextEditingController
                              .text.isEmpty) {
                            displayToastMessage(
                                "Password cannot be empty", context);
                          } else {
                            loginAndAuthicateUser(context);
                            MainScreen();
                          }
                        }),
                  ],
                ),
              ),
              SizedBox(height: 1.0),
              FlatButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context,
                        RegistrationScreenn.idScreen, (route) => false);
                  },
                  child: Text(
                    "Don't have an Account yet? Register Here.",
                    style: TextStyle(fontSize: 15.0, fontFamily: "Brand Bold"),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void loginAndAuthicateUser(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ProgressDialog(
            message: "Authenticating, Please wait...",
          );
        });

    final User? firebaseUser = (await _firebaseAuth
            .signInWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((errMsg) {
      Navigator.pop(context);
      displayToastMessage("Error: " + errMsg.toString(), context);
    }))
        .user;

    if (firebaseUser != null) {
      //check user from database
      //remove value
      usersRef.child(firebaseUser.uid).once().then((DatabaseEvent snap) {
        if (snap.snapshot != null) {
          Navigator.pushNamedAndRemoveUntil(
              context, MainScreen.idScreen, (route) => false);
          displayToastMessage("You are Logged-In :-)", context);
        } else {
          Navigator.pop(context);
          _firebaseAuth.signOut();
          displayToastMessage(
              "User does not exist, Create new account", context);
        }
      });
    } else {
      Navigator.pop(context);
      displayToastMessage("Error Occured, Can't be Signed-In.", context);
    }
  }
}
