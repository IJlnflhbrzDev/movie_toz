// ignore_for_file: must_be_immutable, sized_box_for_whitespace, prefer_const_constructors, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:movie_toz/theme.dart';
import 'package:movie_toz/widget/actor.dart';
import 'package:movie_toz/widget/topbar_icon.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:movie_toz/widget/youtube_video.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key, this.idMovie}) : super(key: key);
  int? idMovie;
  @override
  Widget build(BuildContext context) {
    late String urlDetailMovie =
        'https://api.themoviedb.org/3/movie/$idMovie?api_key=d0a0a33c182200348218e927adb2d643';
    late String urlDetailMovieVideos =
        'https://api.themoviedb.org/3/movie/$idMovie/videos?api_key=d0a0a33c182200348218e927adb2d643';

    late dynamic allDataMovieDb;
    late dynamic allDataMovieDbVideos;

    Future getListDataDetailMovie(idMovie) async {
      try {
        var result = await http.get(Uri.parse(urlDetailMovie));
        var resultVideos = await http.get(Uri.parse(urlDetailMovieVideos));
        var data = json.decode(result.body);
        var dataVideos = json.decode(resultVideos.body)['results'];

        allDataMovieDb = data;
        allDataMovieDbVideos = dataVideos;
      } catch (e) {
        print('Errors $e');
      }
    }

    return Scaffold(
      backgroundColor: cPrimaryColor,
      body: SafeArea(
        top: false,
        child: FutureBuilder(
            future: getListDataDetailMovie(idMovie),
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

              return ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    child: TopBarIcons(),
                    padding: const EdgeInsets.only(left: 9, right: 9),
                  ),

                  //  Display Movie
                  YoutubeVideosMovie(idVideo: allDataMovieDbVideos[0]['key']),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    // color: Colors.red,
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: [
                        Text(
                          '${allDataMovieDb['original_title']}',
                          style: cWhiteTextStyle.copyWith(
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, top: 27),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 50),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${allDataMovieDb['vote_average']}',
                              style: cWhiteTextStyle.copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(width: 35),
                        Row(
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              color: Colors.grey[400],
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${allDataMovieDb['runtime']} Minutes',
                              style: cWhiteTextStyle.copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(width: 35),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: Colors.grey[400],
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${allDataMovieDb['release_date']}',
                              style: cWhiteTextStyle.copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 27),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(' Cast & Crew',
                        style: cWhiteTextStyle.copyWith(fontSize: 18)),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 120,
                    child: ActorMovieToz(idMovie: allDataMovieDb['id']),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Storyline',
                                style: cWhiteTextStyle.copyWith(fontSize: 18)),
                            SizedBox(width: 5),
                            Text(
                              '- ${allDataMovieDb['release_date']}',
                              style: cGreyTextStyle.copyWith(
                                fontSize: 13,
                              ),
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        const SizedBox(height: 3),
                        Text(
                          '${allDataMovieDb['overview']}',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              height: 1.7,
                              color: Colors.grey[350],
                              fontSize: 16,
                              fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
