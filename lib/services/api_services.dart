// ignore_for_file: non_consta, non_constant_identifier_names
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiServices {
  late String API_KEY = 'api_key=d0a0a33c182200348218e927adb2d643';
  late String BASE_URL = 'https://api.themoviedb.org/3';
  // URL API FILM PALING DISUKAI ATAU POPULER
  late String ApiUrlPopularMovie =
      BASE_URL + '/discover/movie?sort_by=popularity.desc&' + API_KEY;

  // URL API FILM YG AKAN DATANG
  late String ApiUrlUpcommingMovie = BASE_URL + '/movie/upcoming' + API_KEY;

  List<Map<String, dynamic>> allDataMovieDb = [];
  void getPosterImage(apiUrl) async {
    try {
      var result = await http.get(Uri.parse(apiUrl));
      List data = (json.decode(result.body) as Map<String, dynamic>)['results'];
      data.forEach((element) {
        allDataMovieDb.add(element);
      });
      print(allDataMovieDb);
    } catch (e) {
      print(e);
    }
  }
}
