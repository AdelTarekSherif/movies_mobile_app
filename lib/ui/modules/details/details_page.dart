import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_mobile_app/bloc/movies/movies_bloc.dart';
import 'package:movies_mobile_app/data/repository/movies/movies_repository.dart';
import 'package:movies_mobile_app/ui/modules/home/home_widget.dart';
import 'package:movies_mobile_app/ui/style/app.colors.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final MoviesBloc _details = MoviesBloc(MoviesRepository());

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var movie = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    _details.add(DetailsEvent(id: movie.movie.id!));
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              opacity: 0.9,
                              image: NetworkImage(
                                "https://image.tmdb.org/t/p/original${movie.movie.posterPath}",
                              ),
                              fit: BoxFit.fill)),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BackButton(
                                color: AppColors.secondaryColor,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              Stack(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: AppColors.secondaryColor,
                                    size:
                                        MediaQuery.of(context).size.width * 0.2,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height:
                                        MediaQuery.of(context).size.width * 0.2,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: Text(
                                      movie.movie.voteAverage!
                                          .toStringAsFixed(1),
                                      style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      movie.movie.title ?? " ",
                      style: TextStyle(
                          color: AppColors.secondaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "Overview",
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          movie.movie.overview ?? " ",
                          style: const TextStyle(
                              wordSpacing: 1,
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "Top Actors",
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      BlocBuilder(
                        bloc: _details,
                        builder: (BuildContext context, state) {
                          if (state is DetailsSuccessful) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: ListView.builder(
                                  itemCount: state.movies.cast!.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (BuildContext context, index) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        children: [
                                          Container(
                                            height:
                                            MediaQuery.of(context).size.height *
                                                0.3,
                                            width:MediaQuery.of(context).size.width *
                                                0.4,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(8),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                      "https://image.tmdb.org/t/p/original${state.movies.cast![index].profilePath}",
                                                    ),
                                                    fit: BoxFit.fill)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              state.movies.cast![index].name ??
                                                  "Null",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              state.movies.cast![index].character ??
                                                  "Null",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            );
                          }

                          return CircularProgressIndicator(
                            color: AppColors.secondaryColor,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
