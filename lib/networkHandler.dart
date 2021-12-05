import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart'; // logger used for arrange the result and error

class NetworkHandler {
  String baseurl = "https://fda.intertoons.com/api/V1";
  var log = new Logger(); // creating instance  for logger

  Future get(String url) async {
    url = formatter(url);
    var response = await http
        .get(url, headers: {"Authorization": "Bearer akhil@intertoons.com"});
    log.i(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    }
  }

  Future<http.Response> post(String url, Map<String, String> body) async {
    log.i(body);
    url = formatter(url);
    var response = await http.post(url,
        headers: {
          "Content-type": "application/json",
          "Authorization": "Bearer akhil@intertoons.com"
        },
        body: json.encode(body));
    return response;
  }

  String formatter(String url) {
    return baseurl + url;
  }
}
