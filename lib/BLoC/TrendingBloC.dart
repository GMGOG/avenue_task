import 'package:rxdart/rxdart.dart';
import 'package:avenue_task/models/TrendingPictures.dart';
import 'package:avenue_task/Networking/repositories.dart';

//Bloc class for Trending Tracks.
class TrendingPhotosBloc {
  final _repository = TrendingRepository(); //This repository is a layer between networking and trending BLoC.
  final _photosFetcher = PublishSubject<TrendingPhotos>();

  Stream<TrendingPhotos> get photos => _photosFetcher.stream;

  //This method fetch trending tracks from REST API.
  fetchTrendingPhotos(int pageNumber) async {
    TrendingPhotos trendingPictures = await _repository.fetchTrendingPhotos(pageNumber);
    _photosFetcher.sink.add(trendingPictures);
  }

  //This method is used to dispose BLoCStream.
  void dispose() {
    _photosFetcher.close();
  }
} // BLoC class ends.

//Global object is defined for Trending Tracks BLoC;
final trendingImagesBloc = TrendingPhotosBloc();
