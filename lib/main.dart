import 'package:final_year_project_rider_app/DataHandler/appData.dart';
import 'package:final_year_project_rider_app/Screens/loginscreen.dart';
import 'package:final_year_project_rider_app/Screens/mainscreen.dart';
import 'package:final_year_project_rider_app/Screens/registrationscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

DatabaseReference usersRef =
    FirebaseDatabase.instance.reference().child("users");

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        title: 'Fiacre Rider App',
        theme: ThemeData(
          fontFamily: "Border Bold",
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: FirebaseAuth.instance.currentUser == null
            ? LoginScreen.idScreen
            : MainScreen.idScreen,
        routes: {
          RegistrationScreenn.idScreen: (context) => RegistrationScreenn(),
          LoginScreen.idScreen: (context) => LoginScreen(),
          MainScreen.idScreen: (context) => MainScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
