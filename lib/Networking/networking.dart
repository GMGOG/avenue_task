import 'dart:convert';
import 'dart:io';
import 'package:avenue_task/Constants/ApiKey.dart';
import 'package:avenue_task/models/SearchModelResponse.dart';
import 'package:avenue_task/models/TrendingPictures.dart';
import 'package:http/http.dart' as http;

class NetworkingHelper {
  Future<TrendingPhotos> fetchTrendingPhotos(int pageNumber) async {
    http.Response response = await http.get(
      'https://api.pexels.com/v1/curated?page=$pageNumber&per_page=40',
      // Send authorization headers to the backend.
      headers: {HttpHeaders.authorizationHeader: kApiKey},
    );
    if (response.statusCode == 200) {
      return TrendingPhotos.fromJson(jsonDecode(response.body));
    } else {
      print(response.statusCode);
      return TrendingPhotos.fromJson(jsonDecode(response.body));
    }
  }

  Future<SearchModel> fetchSearchPhotos(int pageNumber, String query) async {
    http.Response response = await http.get(
      'https://api.pexels.com/v1/search?query=$query&per_page=30',
      // Send authorization headers to the backend.
      headers: {HttpHeaders.authorizationHeader: kApiKey},
    );
    if (response.statusCode == 200) {
      return SearchModel.fromJson(jsonDecode(response.body));
    } else {
      print(response.statusCode);
      return SearchModel.fromJson(jsonDecode(response.body));
    }
  }
}
