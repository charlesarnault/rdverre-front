import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_multipage_form/models.dart';

String URL_DOMAIN = "http://13.38.249.160:5005";

Future<List?> getBestMeetUp(GadjosTeam team) {
  Uri url = Uri.https(URL_DOMAIN, "/best-meet-up/", {"team": jsonEncode(team)});
  return http.get(url, headers: {
    'Content-Type': 'application/json; charset=UTF-8'
  }).then((value) {
    print(value);
  });
}
