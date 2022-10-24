class User {
  String name;
  String loc;

  User({this.name = '', this.loc = ''});
}

class Team {
  List<User> users;

  Team({required this.users});
}

class LatLng {
  double lat;
  double lng;
  LatLng({required this.lat, required this.lng});
}

class Location {
  String? address;
  LatLng? coords;

  Location({this.address, this.coords});
}
