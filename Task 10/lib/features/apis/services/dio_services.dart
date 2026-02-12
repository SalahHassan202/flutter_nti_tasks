import 'package:dio/dio.dart';
import 'package:splach_app/features/apis/model/model.dart';

class DioService {
  final Dio dio = Dio();

  Future<List<FilmModel>> getFilms() async {
    final response = await dio.get("https://ghibliapi.vercel.app/films");

    List data = response.data;

    return data.map((e) => FilmModel.fromJson(e)).toList();
  }
}
