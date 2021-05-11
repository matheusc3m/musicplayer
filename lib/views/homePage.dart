import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:musicplayer/arguments/musicArgs.dart';
import 'package:musicplayer/utils/handle_time.dart';

bool isLoading = true;
List<SongInfo> songs;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();
  void getFiles() async {
    songs = await audioQuery.getSongs();

    setState(() {
      isLoading = false;
    }); //update the UI
  }

  @override
  void initState() {
    getFiles(); //call getFiles() function on initial state.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Minhas músicas",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Color(0xFF8394c6),
                size: 30,
              ),
              onPressed: () {})
        ],
        backgroundColor: Colors.transparent,
      ),
      body: isLoading == false
          ? SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: CustomListView(),
                  ),
                ],
              ),
            )
          : ProfileShimmer(),
    );
  }
}

class CustomListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: songs.length ?? 0,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF30314d),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.19),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            padding: EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  "/music",
                  arguments: MusicArgs(
                      path: songs[index].filePath,
                      duration: songs[index].duration,
                      name: songs[index].title,
                      image: songs[index].albumArtwork,
                      author: songs[index].artist),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: songs[index].albumArtwork == null
                            ? Image.network(
                                "https://conteudo.imguol.com.br/c/noticias/cf/2019/08/10/fone-de-ouvido---tilt-1565457983857_v2_450x337.png",
                                fit: BoxFit.fill,
                                height: 350.0,
                                width: 350.0,
                              )
                            : Image.file(
                                File(songs[index].albumArtwork),
                                fit: BoxFit.fill,
                                height: 350.0,
                                width: 350.0,
                              ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 200.0,
                              child: Text(
                                songs[index].title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: 200.0,
                              child: Text(
                                songs[index].artist,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                style: TextStyle(
                                    color: Color(0xFF8ea1d6), fontSize: 18),
                              ),
                            ),
                          ]),
                    ],
                  ),
                  Text(
                    HandleTime.convertMsToHour(
                      int.parse(songs[index].duration),
                    ),
                    style: TextStyle(color: Color(0xFF8ea1d6), fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
