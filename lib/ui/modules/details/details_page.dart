import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_mobile_app/bloc/movies/movies_bloc.dart';
import 'package:movies_mobile_app/data/repository/movies/movies_repository.dart';
import 'package:movies_mobile_app/ui/modules/home/home_widget.dart';
import 'package:movies_mobile_app/ui/style/app.colors.dart';
import 'package:movies_mobile_app/utils/router/route_names.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final MoviesBloc _details = MoviesBloc(MoviesRepository());
  final MoviesBloc _similar = MoviesBloc(MoviesRepository());

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
    var movie = ModalRoute.of(context)!.settings.arguments as TrendingArguments;
    _details.add(DetailsEvent(id: movie.movie.id!));
    _similar.add(SimilarEvent(id: movie.movie.id!));
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: BackButton(
            color: AppColors.secondaryColor,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            movie.movie.title ?? " ",
            style: TextStyle(
                color: AppColors.secondaryColor,
                fontSize: 25,
                fontWeight: FontWeight.w900),
          ),
        ),
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
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    movie.movie.title ?? " ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w900),
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
                                  color: AppColors.secondaryColor,
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
                          style: TextStyle(
                              wordSpacing: 1,
                              color: AppColors.customGreyLevelSubtitle1,
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
                                  color: AppColors.secondaryColor,
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
                              height: MediaQuery.of(context).size.height * 0.48,
                              child: ListView.builder(
                                  itemCount: state.movies.cast!.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (BuildContext context, index) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 16),
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.25,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  'https://image.tmdb.org/t/p/original${state.movies.cast![index].profilePath}'),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                state.movies.cast![index]
                                                        .name ??
                                                    "Null",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: AppColors
                                                      .customGreyLevelSubtitle1,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w800,
                                                  //  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                state.movies.cast![index]
                                                        .character ??
                                                    "Null",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: AppColors
                                                      .customGreyLevelSubtitle1,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w300,
                                                  //overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            );
                          }

                          return Container();
                        },
                      ),
                    ],
                  ),
                ),
                BlocBuilder(
                  bloc: _similar,
                  builder: (BuildContext context, state) {
                    if (state is SimilarSuccessful) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Similar Movies ',
                                    style: TextStyle(
                                        color: AppColors.secondaryColor,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.4,
                              child: ListView.builder(
                                  itemCount: state.movies.results?.length ?? 0,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 16),
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, RouteNames.rDetailsPage,
                                              arguments: TrendingArguments(state
                                                  .movies.results![index]));
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.3,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                    color:
                                                        AppColors.primaryColor,
                                                  )),
                                                  state.movies.results![index]
                                                              .posterPath !=
                                                          null
                                                      ? FadeInImage
                                                          .memoryNetwork(
                                                          image:
                                                              'https://image.tmdb.org/t/p/original${state.movies.results![index].posterPath}',
                                                          placeholder:
                                                              kTransparentImage,
                                                          fit: BoxFit.contain,
                                                        )
                                                      : Container(),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              state.movies.results![index]
                                                      .title ??
                                                  "Null",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
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
        ),
      ),
    );
  }
}
