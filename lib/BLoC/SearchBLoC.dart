import 'package:avenue_task/models/SearchModelResponse.dart';
import 'package:rxdart/rxdart.dart';
import 'package:avenue_task/Networking/repositories.dart';

//Bloc class for Search Photos.
class SearchPhotosBloc {
  final _repository =
      SearchRepository(); //This repository is a layer between networking and trending BLoC.
  final _photosFetcher = PublishSubject<SearchModel>();

  Stream<SearchModel> get photos => _photosFetcher.stream;

  //This method fetch Search Photos from REST API.
  fetchSearchPhotos(int pageNumber, String query) async {
    SearchModel searchPhotos =
        await _repository.fetchSearchPhotos(pageNumber, query);
    _photosFetcher.sink.add(searchPhotos);
  }

  //This method is used to dispose BLoCStream.
  void dispose() {
    _photosFetcher.close();
  }
} // BLoC class ends.

//Global object is defined for Search Photos BLoC;
final searchPhotosBloc = SearchPhotosBloc();
