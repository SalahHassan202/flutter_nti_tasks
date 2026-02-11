import 'package:dio/dio.dart';
import 'package:splach_app/features/apis/model/model.dart';

class DioServices {
  static final Dio dio = Dio();

  Future<List<Team>> getData() async {
    final response = await dio.get(
      "https://www.thesportsdb.com/api/v1/json/3/search_all_teams.php?l=English%20Premier%20League",
    );

    final List teamsJson = response.data['teams'];

    return teamsJson.map((team) => Team.fromJson(team)).toList();
  }
}
