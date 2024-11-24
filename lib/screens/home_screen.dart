import 'dart:developer';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:download/download_service.dart';
import 'package:download/main.dart';
import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Uint8List? image;
  bool showProgressBar = false;

  ValueNotifier<double> progressNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Home"),
            Container(
              width: 300,
              height: 300,
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (image != null)
                    Image.memory(
                      image!,
                    ),
                  if (showProgressBar)
                    SimpleCircularProgressBar(
                      mergeMode: true,
                      valueNotifier: progressNotifier,
                      onGetText: (p0) {
                        final p = progressNotifier.value;
                        return Text("${p.toInt().toString()}%");
                      },
                    )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () async {
                await _downloadImage();
              },
              child: const Text("Download"),
            )
          ],
        ),
      ),
    );
  }

  Future _downloadImage() async {
    try {
      showProgressBar = true;
      setState(() {});
      final response = await dio.get(
        "https://sample-videos.com/img/Sample-jpg-image-10mb.jpg",
        onReceiveProgress: (value, total) {
          // log("Progress1 $value");
          // log("Progress2: $total");

          progressNotifier.value = (value / total) * 100;
        },
        options: Options(responseType: ResponseType.bytes),
      );

      if (response.statusCode == 200) {
        log("Downloaded");
        image = response.data as Uint8List;
        setState(() {});
      } else {}

      setState(() {
        showProgressBar = false;
      });
    } catch (e) {
      showProgressBar = false;
    }
  }
}
