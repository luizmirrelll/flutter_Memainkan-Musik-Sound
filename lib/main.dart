import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AudioPlayer audioplayers;
  String durasi = "00:00:00";

  _MyAppState() {
    audioplayers = AudioPlayer();
    audioplayers.onAudioPositionChanged.listen((duration) {
      setState(() {
        durasi = duration.toString();
      });
    });
    audioplayers.setReleaseMode(ReleaseMode.LOOP);
  }

  void playsound(String url) async {
    await audioplayers.seek(Duration(seconds: 30));
    await audioplayers.play(url);
  }

  void pausesound() async {
    await audioplayers.pause();
  }

  void stopsound() async {
    await audioplayers.stop();
  }

  void resumesound() async {
    audioplayers.resume();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Memainkan Musik / Sound"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                  child: Text("play"),
                  onPressed: () {
                    playsound(
                        "https://drive.google.com/file/d/1b6jwT9eiZbJdEg4EI2Z4MNx559XxsvVU/view");
                  }),
              RaisedButton(
                  child: Text("pause"),
                  onPressed: () {
                    pausesound();
                  }),
              RaisedButton(
                  child: Text("stop"),
                  onPressed: () {
                    stopsound();
                  }),
              RaisedButton(
                  child: Text("resume"),
                  onPressed: () {
                    resumesound();
                  }),
              Text(
                durasi,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
