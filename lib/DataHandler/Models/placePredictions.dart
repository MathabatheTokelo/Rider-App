class PlacePredictions {
  var secondary_text;
  var main_text;
  var place_id;

  PlacePredictions({this.secondary_text, this.main_text, this.place_id});
  PlacePredictions.fromJson(Map<String, dynamic> json) {
    place_id = (json as dynamic)["place_id"];
    main_text = (json as dynamic)["structured_formatting"]["main_text"];
    secondary_text =
        (json as dynamic)["structured_formatting"]["secondary_text"];
  }
}
