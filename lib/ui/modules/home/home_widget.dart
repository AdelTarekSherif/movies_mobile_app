import 'package:flutter/material.dart';
import 'package:movies_mobile_app/bloc/movies/movies_bloc.dart';
import 'package:movies_mobile_app/data/model/trending_movies_model.dart';
import 'package:movies_mobile_app/data/repository/movies/movies_repository.dart';
import 'package:movies_mobile_app/ui/style/app.colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_mobile_app/utils/router/route_names.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final MoviesBloc _trending2Day = MoviesBloc(MoviesRepository());
  final MoviesBloc _trendingThisWeek = MoviesBloc(MoviesRepository());
  final MoviesBloc _popular = MoviesBloc(MoviesRepository());

  @override
  void initState() {
    super.initState();
    _trending2Day.add(TrendingMovies2DayEvent());
    _trendingThisWeek.add(TrendingThisWeekEvent());
    _popular.add(PopularEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            BlocBuilder(
              bloc: _trending2Day,
              builder: (BuildContext context, state) {
                if (state is Trending2DaySuccessful) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'Trending ',
                              style: TextStyle(
                                  color: AppColors.customGreyLevelSubtitle1,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              ' Today',
                              style: TextStyle(
                                  color: AppColors.customGreyLevelSubtitle2,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: ListView.builder(
                            itemCount: state.movies.results!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 16),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RouteNames.rDetailsPage,
                                        arguments: TrendingArguments(
                                            state.movies.results![index]));
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.3,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  "https://image.tmdb.org/t/p/original${state.movies.results![index].posterPath}",
                                                ),
                                                fit: BoxFit.fill)),
                                      ),
                                      Text(
                                        state.movies.results![index].title ??
                                            "Null",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  );
                } else if (state is Trending2DayError) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: state.msgError == 'No Internet Connection!'
                        ? Container()
                        : Text(
                            state.msgError ?? "Error",
                            style: const TextStyle(
                                fontSize: 24, color: Colors.red),
                          ),
                  );
                }
                return Container();
              },
            ),
            BlocBuilder(
              bloc: _trendingThisWeek,
              builder: (BuildContext context, state) {
                if (state is TrendingThisWeekSuccessful) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'Trending ',
                              style: TextStyle(
                                  color: AppColors.customGreyLevelSubtitle1,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              ' This Week',
                              style: TextStyle(
                                  color: AppColors.customGreyLevelSubtitle2,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: ListView.builder(
                            itemCount: state.movies.results!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 16),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RouteNames.rDetailsPage,
                                        arguments: TrendingArguments(
                                            state.movies.results![index]));
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.3,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  "https://image.tmdb.org/t/p/original${state.movies.results![index].posterPath}",
                                                ),
                                                fit: BoxFit.fill)),
                                      ),
                                      Text(
                                        state.movies.results![index].title ??
                                            "Null",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  );
                } else if (state is TrendingThisWeekError) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: state.msgError == 'No Internet Connection!'
                          ? Container()
                          : Text(
                              state.msgError ?? "Error",
                              style: const TextStyle(
                                  fontSize: 24, color: Colors.red),
                            ),
                    ),
                  );
                }
                return Container();
              },
            ),
            BlocBuilder(
              bloc: _popular,
              builder: (BuildContext context, state) {
                if (state is PopularSuccessful) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'Popular ',
                              style: TextStyle(
                                  color: AppColors.customGreyLevelSubtitle1,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: ListView.builder(
                            itemCount: state.movies.results?.length ?? 0,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 16),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RouteNames.rDetailsPage,
                                        arguments: TrendingArguments(
                                            state.movies.results![index]));
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.3,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  "https://image.tmdb.org/t/p/original${state.movies.results![index].posterPath}",
                                                ),
                                                fit: BoxFit.fill)),
                                      ),
                                      Text(
                                        state.movies.results![index].title ??
                                            "Null",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  );
                } else if (state is PopularError) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        state.msgError ?? "Error",
                        style: const TextStyle(fontSize: 24, color: Colors.red),
                      ),
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.secondaryColor,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TrendingArguments {
  final Results movie;

  TrendingArguments(this.movie);
}
