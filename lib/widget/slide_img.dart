// ignore_for_file: constant_identifier_names, avoid_function_literals_in_foreach_calls, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie_toz/pages/detail.dart';

class SlideImage extends StatelessWidget {
  const SlideImage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const String API_KEY = 'api_key=d0a0a33c182200348218e927adb2d643';
    const String BASE_URL = 'https://api.themoviedb.org/3';
    const String API_URL =
        BASE_URL + '/discover/movie?sort_by=popularity.desc&' + API_KEY;
    List<Map<String, dynamic>> allImageMovieDb = [];

    Future getPosterImage() async {
      try {
        var result = await http.get(Uri.parse(API_URL));
        List data =
            (json.decode(result.body) as Map<String, dynamic>)['results'];
        data.forEach((element) {
          allImageMovieDb.add(element);
        });
      } catch (e) {
        print("Error Slide Img File $e");
      }
    }

    return Container(
      height: 300,
      child: FutureBuilder(
          future: getPosterImage(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Center(
                    child: Text(
                  'Loading...',
                  style: TextStyle(color: Colors.white),
                )),
              );
            } else {
              return CarouselSlider(
                options: CarouselOptions(
                  // viewportFraction: 1,
                  autoPlay: true,
                  height: 300.0,
                  enlargeCenterPage: true,
                ),
                items: allImageMovieDb.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 81, 80, 78)),
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(
                                    DetailPage(
                                      idMovie: item['id'],
                                    ),
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return DetailPage(
                                          idMovie: item['id'],
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/w500' +
                                      item['poster_path'],
                                  width: 1000.00,
                                  fit: BoxFit.cover,
                                  // color: cBoxColor,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('${item['original_title']}',
                                    style: const TextStyle(
                                        letterSpacing: 1.1,
                                        shadows: [
                                          Shadow(
                                            blurRadius: 1.0,
                                            color: Colors.black,
                                            offset: Offset(2.0, 1.0),
                                          )
                                        ],
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ));
                    },
                  );
                }).toList(),
              );
            }
          }),
    );
  }
}
