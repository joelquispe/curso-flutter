import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class VideoViewScreen extends StatefulWidget {
  const VideoViewScreen({super.key});

  @override
  State<VideoViewScreen> createState() => _VideoViewScreenState();
}

class _VideoViewScreenState extends State<VideoViewScreen> {
  late VideoPlayerController controllerVideo;
  bool isVideoVisible = false;
  XFile? video;

  pickerVideo() async {
    video = await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (video != null) {
      controllerVideo = VideoPlayerController.file(File(video!.path))
        ..initialize().then((value) {
          isVideoVisible = true;
          controllerVideo.play();
          setState(() {});
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                pickerVideo();
              },
              child: const Text("Pick video")),
          isVideoVisible
              ? SizedBox(
                height: 200,
                child: AspectRatio(
                    aspectRatio: controllerVideo.value.aspectRatio,
                    child: VideoPlayer(controllerVideo),
                  ),
              )
              : const SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    controllerVideo.play();
                  },
                  child: const Text("Play")),
              ElevatedButton(
                  onPressed: () {
                    controllerVideo.pause();
                  },
                  child: const Text("Stop")),
              ElevatedButton(
                  onPressed: () {
                    controllerVideo.seekTo(Duration.zero);
                  },
                  child: const Text("Reset")),
            ],
          )
        ],
      ),
    );
  }
}
