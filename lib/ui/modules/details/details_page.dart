import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_mobile_app/ui/modules/home/home_widget.dart';
import 'package:movies_mobile_app/ui/style/app.colors.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
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
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        opacity: 0.7,
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
                                size: MediaQuery.of(context).size.width*0.2,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: MediaQuery.of(context).size.width*0.2,
                                width: MediaQuery.of(context).size.width*0.2,
                                child: Text(
                                  movie.movie.voteAverage!.toStringAsFixed(1),
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
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,

                        ),

                        child: Text(
                          movie.movie.title ?? " ",
                          style: TextStyle(
                              color: AppColors.secondaryColor,
                              fontSize: 25,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: ListView.builder(
                  //       scrollDirection: Axis.horizontal,
                  //       itemBuilder: (BuildContext context,index){
                  //         return null;
                  //
                  //
                  //       })
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
