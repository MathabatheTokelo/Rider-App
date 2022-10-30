import 'dart:math';

import 'package:final_year_project_rider_app/Assistants/request_assistant.dart';
import 'package:final_year_project_rider_app/DataHandler/Models/address.dart';
import 'package:final_year_project_rider_app/DataHandler/Models/directionDetails.dart';
import 'package:final_year_project_rider_app/DataHandler/appData.dart';
import 'package:final_year_project_rider_app/configMaps.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../DataHandler/Models/allUsers.dart';

class AssistantMethods {
  static Future<String> searchCoordinateAddress(
      Position position, context) async {
    var placeAddres = "";
    String st1, st2, st3, st4;
    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapKey";
    var response = await RequestAssistant.getRequest(url);
    if (response != "failed.") {
      placeAddres = response["results"][0]["formatted_address"];
/*      st1 = response["results"][0]["address_components"][3]["short_name"];
      st2 = response["results"][0]["address_components"][4]["long_name"];
      st3 = response["results"][0]["address_components"][5]["long_name"];
      st4 = response["results"][0]["address_components"][6]["long_name"];
      placeAddres = st1 + " " + st2 + " " + st3;
*/
      Address userPickUpAddress = new Address();
      userPickUpAddress.longitude = position.longitude;
      userPickUpAddress.latitude = position.latitude;
      userPickUpAddress.placeName = placeAddres;

      Provider.of<AppData>(context, listen: false)
          .updatePickUpLocationAddress(userPickUpAddress);
    }
    return placeAddres;
  }

  static Future<DirectionDetails> obtainPlaceDirectionDetails(
      LatLng initialPosition, LatLng finalPosition) async {
    var directionUrl =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${initialPosition.latitude},${initialPosition.longitude}&destination=${finalPosition.latitude},${finalPosition.longitude}&key=$mapKey";

    var res = await RequestAssistant.getRequest(directionUrl);
    if (res == "failed") {
      print("Not done");
      // return null;
    }
    DirectionDetails directionDetails = DirectionDetails();
    directionDetails.encodedPoints =
        res["routes"][0]["overview_polyline"]["points"];
    directionDetails.distanceText =
        res["routes"][0]["legs"][0]["distance"]["text "];
    directionDetails.distanceValue =
        res["routes"][0]["legs"][0]["distance"]["value"];
    directionDetails.durationText =
        res["routes"][0]["legs"][0]["duration"]["text"];
    directionDetails.durationValue =
        res["routes"][0]["legs"][0]["duration"]["value"];
    print(directionDetails.distanceValue);
    return directionDetails;
  }

  static int calculateFares(DirectionDetails directionDetails) {
    double timeTraveledFare = (directionDetails.durationValue / 60) * 0.20;
    double distanceTraveledFare =
        (directionDetails.distanceValue / 1000) * 0.20;
    double totalFareAmount = timeTraveledFare + distanceTraveledFare;
    //changing the currency to rands

    double localAmount = totalFareAmount * 16.75;
    return localAmount.truncate();
  }

  static Future<void> getCurrentOnLineUserInfo() async {
    firebaseUser = await FirebaseAuth.instance.currentUser;
    String userId = firebaseUser!.uid;
    DatabaseReference reference =
        FirebaseDatabase.instance.ref().child("user").child(userId);

    final snapshot =
        await reference.get(); // you should use await on async methods
    if (snapshot.value != null) {
      userCurrentInfo = Users.fromSnapshot(snapshot);
    }
  }

  static double createRandomNumber(int number) {
    var random = Random();
    int radNumber = random.nextInt(number);
    return radNumber.toDouble();
  }
}
