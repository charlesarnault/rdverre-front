class Location {
  String name;
  double? lat;
  double? lng;

  Location({this.name = "", this.lat, this.lng});
}

class Gadjo {
  String name;
  Location loc;

  Gadjo({this.name = "", required this.loc});
}

class GadjosTeam {
  List<Gadjo> gadjos;

  GadjosTeam({required this.gadjos});

  factory GadjosTeam.defaultTeam() {
    return GadjosTeam(gadjos: [
      Gadjo(
          name: "Chay",
          loc: Location(
              name: "79 rue de la Tour", lat: 48.861838, lng: 2.278190)),
      Gadjo(
          name: "Ad",
          loc:
              Location(name: "Place des Vosges", lat: 48.856222, lng: 2.364736))
    ]);
  }
}
