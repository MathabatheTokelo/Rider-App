import 'package:final_year_project_rider_app/Assistants/request_assistant.dart';
import 'package:final_year_project_rider_app/DataHandler/Models/address.dart';
import 'package:final_year_project_rider_app/DataHandler/appData.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class AssistantMethods {
  static Future<String> searchCoordinateAddress(
      Position position, context) async {
    String placeAddres = "";
    String st1, st2, st3, st4;
    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=AIzaSyAqNTyL2pxuryBOnkNApWU257me8961uKQ";
    var response = await RequestAssistant.getRequest(url);
    if (response != "Failed.") {
      //placeAddres = response["results"][0]["formatted_address"];
      st1 = response["results"][0]["address_components"][3]["long_name"];
      st2 = response["results"][0]["address_components"][4]["long_name"];
      st3 = response["results"][0]["address_components"][5]["long_name"];
      st4 = response["results"][0]["address_components"][6]["long_name"];
      placeAddres = st1 + " " + st2 + "" + st3 + " " + st4;

      Address userPickUpAddress = new Address();
      userPickUpAddress.longitude = position.longitude;
      userPickUpAddress.latitude = position.latitude;
      userPickUpAddress.placeName = placeAddres;

      Provider.of<AppData>(context)
          .updatePickUpLocationAddress(userPickUpAddress);
    }
    return placeAddres;
  }
}
