import 'package:avenue_task/Networking/networking.dart';
import 'package:avenue_task/models/SearchModelResponse.dart';
import 'package:avenue_task/models/TrendingPictures.dart';

// Class for repository  of Trending tracks.
class TrendingRepository {
  final NetworkingHelper _helper = NetworkingHelper();

  Future<TrendingPhotos> fetchTrendingPhotos(int pageNumber) =>
      _helper.fetchTrendingPhotos(pageNumber);
}

class SearchRepository {
  final NetworkingHelper _helper = NetworkingHelper();

  Future<SearchModel> fetchSearchPhotos(int pageNumber, String query) =>
      _helper.fetchSearchPhotos(pageNumber, query);
}
