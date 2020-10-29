import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:koleksyon/models/splash_image.dart';

class SplashAPI{
  final baseURL = 'https://api.unsplash.com';
  final clientId = 'client_id=cnYtichGMPHQLt5GfN1EVzwOkwjEW7lpPXRmBdYvQu4';
  http.Client httpClient  =  http.Client();

  Future<List<SplashImage>> searchImage(String key) async {
    final url = "$baseURL/search/photos?page=1&query=$key&$clientId";

    final response = await httpClient.get(url);
    if (response.statusCode == 200){
      Map<String, dynamic> json = jsonDecode(response.body);
      var results = json['results'] as List;
      List<SplashImage> imageList = results.map((i) => SplashImage.fromJson(i)).toList();
      return imageList;
    }
    else {
      throw Exception("Failed to fetch search");
    }
  }
}