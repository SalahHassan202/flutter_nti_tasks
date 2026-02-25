import 'package:flutter/material.dart';
import 'package:movie_streaming_app/core/data/api/api_services.dart';
import 'package:movie_streaming_app/core/data/enums/request_status_enum.dart';
import 'package:movie_streaming_app/core/data/models/movies_model.dart';

class MoviesController extends ChangeNotifier {
  List<MoviesModel> _mainMoviesList = [];
  List<MoviesModel> _filteredMoviesList = [];
  RequestStatusEnum _requestStatus = RequestStatusEnum.loaded;
  final TextEditingController _searchC = TextEditingController();

  List<MoviesModel> get mainMoviesList => _mainMoviesList;
  List<MoviesModel> get filteredMoviesList => _filteredMoviesList;
  RequestStatusEnum get requestStatus => _requestStatus;
  TextEditingController get searchC => _searchC;

  MoviesController() {
    getData();
  }

  Future<void> getData() async {
    try {
      _requestStatus = RequestStatusEnum.loading;
      notifyListeners();

      _mainMoviesList = await ApiServices().getMovies();
      _filteredMoviesList = List.from(_mainMoviesList);
      _requestStatus = RequestStatusEnum.loaded;
    } catch (e) {
      _requestStatus = RequestStatusEnum.error;
    }
    notifyListeners();
  }

  void searchFunction(String keyWord) {
    _filteredMoviesList = _mainMoviesList.where((movie) {
      final title = movie.title.toString().toLowerCase();
      final body = movie.releaseDate.toString().toLowerCase();
      final input = keyWord.toLowerCase();

      // return title.startsWith(inputw);
      return title.contains(input) || body.contains(input);
    }).toList();
    notifyListeners();
  }

  void reset() {
    _filteredMoviesList = List.from(_mainMoviesList);
    _searchC.clear();
    notifyListeners();
  }
}
