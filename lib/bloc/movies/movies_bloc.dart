import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_mobile_app/data/model/movie_details_model.dart';
import 'package:movies_mobile_app/data/model/movies_model.dart';
import 'package:movies_mobile_app/data/repository/movies/movies_repository.dart';

part 'movies_event.dart';

part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc(this._moviesRepository) : super(MoviesInitial()) {
    on<TrendingMovies2DayEvent>(onGetTrendingMovies2dayEvent);
    on<TrendingThisWeekEvent>(onGetTrendingMoviesThisWeekEvent);
    on<PopularEvent>(onGetPopularEvent);
    on<DetailsEvent>(onGetDetailsEvent);
    on<SearchEvent>(onGetSearchEvent);
    on<SimilarEvent>(onGetSimilarEvent);
  }

  final MoviesRepository _moviesRepository;

  onGetTrendingMovies2dayEvent(
      TrendingMovies2DayEvent event, Emitter<MoviesState> emit) async {
    try {
      var result = await _moviesRepository.getTrendingMovies2day();
      var movies = MoviesModel.fromJson(result);
      emit(Trending2DaySuccessful(movies));
    } catch (e) {
      emit(Trending2DayError(e.toString()));
    }
  }

  onGetTrendingMoviesThisWeekEvent(
      TrendingThisWeekEvent event, Emitter<MoviesState> emit) async {
    try {
      var result = await _moviesRepository.getTrendingMoviesThisWeek();
      var movies = MoviesModel.fromJson(result);
      emit(TrendingThisWeekSuccessful(movies));
    } catch (e) {
      emit(TrendingThisWeekError(e.toString()));
    }
  }

  onGetPopularEvent(PopularEvent event, Emitter<MoviesState> emit) async {
    try {
      var result = await _moviesRepository.getPopular();
      var movies = MoviesModel.fromJson(result);
      emit(PopularSuccessful(movies));
    } catch (e) {
      emit(PopularError(e.toString()));
    }
  }

  onGetDetailsEvent(DetailsEvent event, Emitter<MoviesState> emit) async {
    try {
      var result = await _moviesRepository.getMovieDetails(event.id);
      var movies = MovieDetails.fromJson(result);
      emit(DetailsSuccessful(movies));
    } catch (e) {
      emit(DetailsError(e.toString()));
    }
  }
  onGetSearchEvent(SearchEvent event, Emitter<MoviesState> emit) async {
    try {
      var result = await _moviesRepository.getSearchMovie(event.name);
      var movies = MoviesModel.fromJson(result);
      emit(SearchSuccessful(movies));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
  onGetSimilarEvent(SimilarEvent event, Emitter<MoviesState> emit) async {
    try {
      var result = await _moviesRepository.getSimilarMovies(event.id);
      var movies = MoviesModel.fromJson(result);
      emit(SimilarSuccessful(movies));
    } catch (e) {
      emit(SimilarError(e.toString()));
    }
  }
}
