part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {}

class MoviesInitial extends MoviesState {
  @override
  List<Object?> get props => [];
}

class Trending2DaySuccessful extends MoviesState {
  final MoviesModel movies;

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
  final MoviesModel movies;

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
  final MoviesModel movies;

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

class SearchSuccessful extends MoviesState {
  final MoviesModel movies;

  SearchSuccessful(this.movies);

  @override
  List<Object?> get props => [movies];
}

class SearchError extends MoviesState {
  final String? msgError;

  SearchError(this.msgError);

  @override
  List<Object?> get props => [msgError];
}

class SimilarSuccessful extends MoviesState {
  final MoviesModel movies;

  SimilarSuccessful(this.movies);

  @override
  List<Object?> get props => [movies];
}

class SimilarError extends MoviesState {
  final String? msgError;

  SimilarError(this.msgError);

  @override
  List<Object?> get props => [msgError];
}