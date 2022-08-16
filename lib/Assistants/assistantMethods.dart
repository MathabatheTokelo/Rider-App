import 'package:final_year_project_rider_app/Assistants/request_assistant.dart';
import 'package:final_year_project_rider_app/DataHandler/Models/address.dart';
import 'package:geolocator/geolocator.dart';

class AssistantMethods {git remote set-url origin git://new.url.here
  static Future<String> searchCoordinateAddress(Position position) async {
    String placeAddres = "";
    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=AIzaSyAqNTyL2pxuryBOnkNApWU257me8961uKQ";
    var response = await RequestAssistant.getRequest(url);
    if (response != "Failed.") {
      placeAddres = response["results"][0]["formatted_address"];

      Address userPickUpAddress = new Address();
    }
    return placeAddres;
  }
}
