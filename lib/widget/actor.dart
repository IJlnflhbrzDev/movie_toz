// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:movie_toz/theme.dart';

class ActorMovieToz extends StatelessWidget {
  final int? idMovie;
  const ActorMovieToz({this.idMovie, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String urlDetailActorMovies =
        'https://api.themoviedb.org/3/movie/$idMovie/credits?api_key=d0a0a33c182200348218e927adb2d643';
    List allDataMovieDbActorMovies = [];

    Future getListDataDetailActorMovie(idMovie) async {
      try {
        var resultActorMovies = await http.get(Uri.parse(urlDetailActorMovies));
        var dataActorMovies = json.decode(resultActorMovies.body)['cast'];
        dataActorMovies.forEach((element) {
          allDataMovieDbActorMovies.add(element);
        });
      } catch (e) {
        print('Errors $e');
      }
    }

    return FutureBuilder(
      future: getListDataDetailActorMovie(idMovie),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Center(
              child: Text(
                'Loading...',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: allDataMovieDbActorMovies.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.only(left: 20),
              child: InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: allDataMovieDbActorMovies[index]["profile_path"] ==
                              null
                          ? Image.network(
                              'https://t3.ftcdn.net/jpg/00/36/94/26/360_F_36942622_9SUXpSuE5JlfxLFKB1jHu5Z07eVIWQ2W.jpg',
                              fit: BoxFit.cover,
                              width: 70,
                              height: 70,
                            )
                          : Image.network(
                              'https://image.tmdb.org/t/p/w500/${allDataMovieDbActorMovies[index]["profile_path"]}',
                              fit: BoxFit.cover,
                              width: 70,
                              height: 70,
                            ),
                    ),
                    allDataMovieDbActorMovies[index]['name'] == null
                        ? const Text('IJlnflhbrz')
                        : Text(
                            allDataMovieDbActorMovies[index]['name'].length > 5
                                ? allDataMovieDbActorMovies[index]['name']
                                        .substring(0, 5) +
                                    ''
                                : allDataMovieDbActorMovies[index]['name'],
                            style: cWhiteTextStyle.copyWith(
                                fontSize: 16, height: 1.8),
                          ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
