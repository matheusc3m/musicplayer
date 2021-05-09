import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicplayer/arguments/musicArgs.dart';
import 'package:musicplayer/client/background.dart';

class MusicPage extends StatefulWidget {
  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  @override
  Widget build(BuildContext context) {
    Background background = Background.instance;
    final MusicArgs args = ModalRoute.of(context).settings.arguments;
    var item = MediaItem(
      id: args.path,
      title: args.name,
      album: args.author,
    );

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Center(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: args.image != null
                    ? Image.file(
                        File(args.image),
                        fit: BoxFit.fill,
                        height: 350.0,
                        width: 350.0,
                      )
                    : Image.network(
                        "https://conteudo.imguol.com.br/c/noticias/cf/2019/08/10/fone-de-ouvido---tilt-1565457983857_v2_450x337.png",
                        fit: BoxFit.fill,
                        height: 350.0,
                        width: 350.0,
                      )),
          ),
          SizedBox(height: 40),
          Text(
            args.name,
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          Text(
            args.author,
            style: TextStyle(color: Color(0xFF5d6991), fontSize: 20),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(children: [
              Text(
                "0:00",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              Expanded(
                child: Slider(
                  activeColor: Colors.deepPurple,
                  value: 0,
                  onChanged: (v) {},
                ),
              ),
              Text(
                "3:00",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                splashRadius: 30,
                color: Color(0xFF474575),
                iconSize: 40,
                icon: Icon(
                  Icons.fast_rewind,
                ),
                onPressed: () {},
              ),
              IconButton(
                  splashRadius: 40,
                  color: Colors.deepPurple,
                  iconSize: 70,
                  icon: Icon(Icons.play_circle_fill),
                  onPressed: () async {
                    background.onPlay(item: args.path);
                  }),
              IconButton(
                splashRadius: 30,
                color: Color(0xFF474575),
                iconSize: 40,
                icon: Icon(
                  Icons.fast_forward,
                ),
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
    );
  }
}
