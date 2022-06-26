class Location {
  String name;
  double? lat;
  double? lng;

  Location({this.name = "", this.lat, this.lng});

  Map<String, dynamic> toJson() {
    return {"name": name, "lat": lat, "lng": lng};
  }
}

class Gadjo {
  String name;
  Location location;

  Gadjo({this.name = "", required this.location});

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "location": location.toJson(),
    };
  }
}

class GadjosTeam {
  List<Gadjo> gadjos;

  GadjosTeam({required this.gadjos});

  List toJson() {
    List json = [];
    gadjos.forEach((element) => json.add(element.toJson()));
    return json;
  }

  factory GadjosTeam.defaultTeam() {
    return GadjosTeam(gadjos: [
      Gadjo(
          name: "Chay",
          location: Location(
              name: "79 rue de la Tour", lat: 48.861838, lng: 2.278190)),
      Gadjo(
          name: "Ad",
          location:
              Location(name: "Place des Vosges", lat: 48.856222, lng: 2.364736))
    ]);
  }
}
