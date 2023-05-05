part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {}

class MoviesInitial extends MoviesState {
  @override
  List<Object?> get props => [];
}

class Trending2DaySuccessful extends MoviesState {
  final TrendingMoviesModel movies;

  Trending2DaySuccessful(this.movies);

  @override
  List<Object?> get props => [movies];
}

class Trending2DayError extends MoviesState {
  final String? msgError;

  Trending2DayError(this.msgError);

  @override
  List<Object?> get props => [msgError];
}

class TrendingThisWeekSuccessful extends MoviesState {
  final TrendingMoviesModel movies;

  TrendingThisWeekSuccessful(this.movies);

  @override
  List<Object?> get props => [movies];
}

class TrendingThisWeekError extends MoviesState {
  final String? msgError;

  TrendingThisWeekError(this.msgError);

  @override
  List<Object?> get props => [msgError];
}

class PopularSuccessful extends MoviesState {
  final PopularMoviesModel movies;

  PopularSuccessful(this.movies);

  @override
  List<Object?> get props => [movies];
}

class PopularError extends MoviesState {
  final String? msgError;

  PopularError(this.msgError);

  @override
  List<Object?> get props => [msgError];
}

class DetailsSuccessful extends MoviesState {
  final MovieDetails movies;

  DetailsSuccessful(this.movies);

  @override
  List<Object?> get props => [movies];
}

class DetailsError extends MoviesState {
  final String? msgError;

  DetailsError(this.msgError);

  @override
  List<Object?> get props => [msgError];
}
