import 'package:final_year_project_rider_app/DataHandler/Models/nearbyAvailableDrivers.dart';

class GeoFireAssistant {
  static List<NearbyAvailableDrivers> nearbyAvailableDriversList = [];

  static void removeDriverFromList(var key) {
    int index =
        nearbyAvailableDriversList.indexWhere((element) => element.key == key);
    nearbyAvailableDriversList.removeAt(index);
  }

  static void updateDriverNearbyLocation(NearbyAvailableDrivers driver) {
    int index = nearbyAvailableDriversList
        .indexWhere((element) => element.key == driver.key);
    nearbyAvailableDriversList[index].latitude = driver.latitude;
    nearbyAvailableDriversList[index].longitude = driver.longitude;
  }
}
