import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import './UnescoSite.dart';
import 'package:http/http.dart' as http;

class Services {
  // static const String localUrl =
  //     'load_json/world-heritage-list-india-fields.json';

  static const String localUrl = 'load_json/world-heritage-list-fields.json';

  static const String imageSearchUrl =
      'https://www.googleapis.com/customsearch/v1/';

  static const apiKey = 'AIzaSyBMb98JwQGRp8It8vEn0JeRGfEgqBtpxt8';
  // static const searchEngineId = 'ab24d10c08cc76608';
  static const searchEngineId = 'fc7e653353ee5d25d';
  static const searchType = 'image';
  static String query = 'taj mahal';

  static Future<List<UnescoSite>> getUnescoSites() async {
    var response = await rootBundle.loadString(localUrl);
    try {
      if (response != null) {
        var list = parseSites(response);
        return list;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<UnescoSite> parseSites(String response) {
    var jsonData = jsonDecode(response.toString()).cast<Map<String, dynamic>>();

    return jsonData
        .map<UnescoSite>((item) => UnescoSite.fromJson(item))
        .toList();
  }

  static Future<List<dynamic>> getImages(String q) async {
    // https://www.googleapis.com/customsearch/v1/siterestrict?key=AIzaSyBMb98JwQGRp8It8vEn0JeRGfEgqBtpxt8&cx=ab24d10c08cc76608&q=mahabaliburam&searchType=image

    query = q;
    var response = await http.get(
        '$imageSearchUrl?key=$apiKey&cx=$searchEngineId&q=$query&searchType=$searchType');
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);

      List<dynamic> items = jsonData['items'];

      List<dynamic> imageLinks = items.map((item) => item['link']).toList();
      // print(imageLinks);
      return imageLinks;
    } else {
      print(response.statusCode);
      return null;
    }
  }
}
