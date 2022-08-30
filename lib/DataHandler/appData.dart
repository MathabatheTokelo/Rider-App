import 'package:final_year_project_rider_app/DataHandler/Models/address.dart';
import 'package:flutter/cupertino.dart';

class AppData extends ChangeNotifier {
  var pickUpLocation, dropOffLocation;

  void updatePickUpLocationAddress(Address pickUpAddress) {
    pickUpLocation = pickUpAddress;
    notifyListeners();
  }

  void updateDropOffLocationAddress(Address dropOffAddress) {
    dropOffLocation = dropOffAddress;
    notifyListeners();
  }
}
