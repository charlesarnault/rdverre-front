import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_multipage_form/models.dart';

String URL_DOMAIN = "13.38.249.160:5005";

Future<List?> getBestMeetUp(GadjosTeam team) {
  Uri url = Uri.http(URL_DOMAIN, "/best-meet-up/");
  return http.post(url, body: jsonEncode(team), headers: {
    'Content-Type': 'application/json; charset=UTF-8'
  }).then((response) {
    print(response.statusCode);
    print(response.body);
  });
}
