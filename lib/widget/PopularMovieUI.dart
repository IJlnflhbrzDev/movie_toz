// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable, avoid_print, constant_identifier_names, unnecessary_string_interpolations, unused_local_variable

import 'package:flutter/material.dart';
import 'package:movie_toz/model/PopularMovieModel.dart';
import 'package:movie_toz/pages/detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:movie_toz/theme.dart';

class PopularMovieUI extends StatelessWidget {
  const PopularMovieUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String API_KEY = 'api_key=d0a0a33c182200348218e927adb2d643';
    const String BASE_URL = 'https://api.themoviedb.org/3';
    // URL API FILM PALING DISUKAI ATAU POPULER
    const String API_URL_POPULAR =
        BASE_URL + '/discover/movie?sort_by=popularity.desc&' + API_KEY;

    List<PopularMovieModel> allDataMovieDb = [];
    Future getListDataPopularMovie() async {
      try {
        var result = await http.get(Uri.parse(API_URL_POPULAR));
        List data =
            (json.decode(result.body) as Map<String, dynamic>)['results'];
        data.forEach((element) {
          allDataMovieDb.add(PopularMovieModel.fromJson(element));
        });
      } catch (e) {
        print(e);
      }
    }

    return FutureBuilder(
      future: getListDataPopularMovie(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Center(
                child: Text(
              'Loading...',
              style: TextStyle(color: Colors.white),
            )),
          );
        } else if (allDataMovieDb.isEmpty) {
          return Center(
            child: Text(
              'Data Kosong',
              style: cWhiteTextStyle,
            ),
          );
        }
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: allDataMovieDb.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DetailPage(
                          idMovie: allDataMovieDb[index].id,
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  width: 170,
                  height: 200,
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(13)),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500${allDataMovieDb[index].posterPath}',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // NOTED : JUDUL MOVIE
                      Text(
                        '${allDataMovieDb[index].originalTitle}',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      // NOTED Popularity
                      Text(
                        'Popularity :  ${allDataMovieDb[index].popularity}',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[400]),
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 5),

                      // NOTED : RATING
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 16,
                          ),
                          SizedBox(width: 5),
                          Text('${allDataMovieDb[index].voteAverage}',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[400])),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}
