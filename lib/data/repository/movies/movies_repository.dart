import 'package:movies_mobile_app/utils/api_caller.dart';
import 'package:movies_mobile_app/utils/constants.dart';

class MoviesRepository {
  final APICaller _apiCaller = APICaller();

  Future getTrendingMovies2day() async {
    _apiCaller.setUrl("/trending/movie/day?api_key=${Constants.apiKey}");
    var response = await _apiCaller.getData();
    return response;
  }

  Future getTrendingMoviesThisWeek() async {
    _apiCaller.setUrl("/trending/movie/week?api_key=${Constants.apiKey}");
    var response = await _apiCaller.getData();
    return response;
  }

  Future getPopular() async {
    _apiCaller.setUrl("/movie/popular?api_key=${Constants.apiKey}");
    var response = await _apiCaller.getData();
    return response;
  }

  Future getMovieDetails(int? id) async {
    _apiCaller.setUrl("/movie/$id/credits?api_key=${Constants.apiKey}");
    var response = await _apiCaller.getData();
    return response;
  }

  Future getSearchMovie(String name) async {
    _apiCaller.setUrl("/search/movie?api_key=${Constants.apiKey}&query=$name");
    var response = await _apiCaller.getData();
    return response;
  }

  Future getSimilarMovies(int id) async {
    _apiCaller.setUrl("/movie/$id/similar?api_key=${Constants.apiKey}");
    var response = await _apiCaller.getData();
    return response;
  }
}
