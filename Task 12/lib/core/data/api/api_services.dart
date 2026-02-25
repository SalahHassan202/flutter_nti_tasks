import 'package:dio/dio.dart';
import 'package:movie_streaming_app/core/data/models/movies_model.dart';

class ApiServices {
  final Dio dio = Dio();

  Future<List<MoviesModel>> getMovies() async {
    var response = await dio.get("https://ghibliapi.vercel.app/films");
    final List<dynamic> data = response.data;
    final List<MoviesModel> moviesList = data
        .map((e) => MoviesModel.fromJson(e))
        .toList();

    return moviesList;
  }
}
