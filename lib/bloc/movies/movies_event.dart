part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {}

class TrendingMovies2DayEvent extends MoviesEvent {
  @override
  List<Object?> get props => [];
}

class TrendingThisWeekEvent extends MoviesEvent {
  @override
  List<Object?> get props => [];
}

class PopularEvent extends MoviesEvent {
  @override
  List<Object?> get props => [];
}

class DetailsEvent extends MoviesEvent {
  final int id;

  DetailsEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
