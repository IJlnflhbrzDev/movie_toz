// ignore_for_file: unused_element, must_be_immutable

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideosMovie extends StatefulWidget {
  YoutubeVideosMovie({this.idVideo, Key? key}) : super(key: key);
  late String? idVideo;

  @override
  State<YoutubeVideosMovie> createState() => _YoutubeVideosMovieState();
}

class _YoutubeVideosMovieState extends State<YoutubeVideosMovie> {
  @override
  Widget build(BuildContext context) {
    String? idVideos = widget.idVideo;
    late String? urlTrailerMovie = 'https://www.youtube.com/watch?v=$idVideos';
    late YoutubePlayerController controller = YoutubePlayerController(
        initialVideoId:
            YoutubePlayer.convertUrlToId(urlTrailerMovie).toString(),
        flags: const YoutubePlayerFlags(
            mute: false, // video ini auto ada suaranya
            loop: false, // video ini tidak di ulang
            autoPlay: false // video ini auto di mulai
            ));

    @override
    void deactivate() {
      controller.pause();

      super.deactivate();
    }

    @override
    void dispose() {
      controller.dispose();

      super.deactivate();
    }

    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: controller),
      builder: (context, player) {
        return Container(
          child: player,
        );
      },
    );
  }
}
