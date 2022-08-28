import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Users {
  var id;
  var email;
  var name;
  var phone;

  Users({this.id, this.email, this.name, this.phone});
  Users.fromSnapShot(DataSnapshot dataSnapshot) {
    id = dataSnapshot.key;
    email = (dataSnapshot.value as dynamic)["email"];
    name = (dataSnapshot.value as dynamic)["name"];
    phone = (dataSnapshot.value as dynamic)["phone"];
  }
}
