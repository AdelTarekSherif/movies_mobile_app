import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_mobile_app/bloc/movies/movies_bloc.dart';
import 'package:movies_mobile_app/data/repository/movies/movies_repository.dart';
import 'package:movies_mobile_app/ui/common/custom_text_field.dart';
import 'package:movies_mobile_app/ui/modules/home/home_widget.dart';
import 'package:movies_mobile_app/ui/style/app.colors.dart';
import 'package:movies_mobile_app/utils/router/route_names.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController name = TextEditingController();
  String movieName = '';
  final MoviesBloc _search = MoviesBloc(MoviesRepository());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: CustomTextField(
            title: 'Search',

            textEditingController: name,
            onChanged: (searchText) {
              setState(() {
                _search.add(SearchEvent(name: searchText));
              });
            },
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            suffixIcon: InkWell(
                onTap: () {
                  setState(() {});
                },
                child: const Icon(
                  Icons.search,
                  color: Colors.black,
                )),
          ),
        ),
        BlocBuilder(
            bloc: _search,
            builder: (BuildContext context, state) {
              if (state is SearchSuccessful) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: state.movies.results?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border:
                                  Border.all(color: AppColors.secondaryColor)),
                          height: MediaQuery.of(context).size.height * 0.15,
                          // width: MediaQuery.of(context).size.width,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteNames.rDetailsPage,
                                  arguments: TrendingArguments(
                                      state.movies.results![index]));
                            },
                            child: Row(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            "https://image.tmdb.org/t/p/original${state.movies.results![index].backdropPath}",
                                          ),
                                          fit: BoxFit.fill)),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          state.movies.results![index].title ??
                                              "Null",
                                          style: TextStyle(
                                              fontSize: 18,
                                              overflow: TextOverflow.ellipsis,
                                              color: AppColors
                                                  .customGreyLevelSubtitle1),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          state.movies.results![index]
                                                  .overview ??
                                              "Null",
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 16,
                                              color: AppColors
                                                  .customGreyLevelSubtitle1),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                );
              } else if (state is SearchError) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    state.msgError ?? "Error",
                    style: const TextStyle(fontSize: 24, color: Colors.red),
                  ),
                );
              }
              return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Enter Movie Name",style: TextStyle(
              fontSize: 24,
              color: AppColors.customGreyLevelSubtitle2
              ),),
              );
            })
      ],
    );
  }
}
