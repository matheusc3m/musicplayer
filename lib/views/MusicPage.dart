import 'package:flutter/material.dart';

class MusicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(children: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              "https://fanart.tv/fanart/music/c8b03190-306c-4120-bb0b-6f2ebfc06ea9/albumcover/after-hours-5e756e2ce9573.jpg",
              fit: BoxFit.fill,
              height: 350.0,
              width: 350.0,
            ),
          ),
        ),
        SizedBox(height: 40),
        Text(
          "Escape from LA",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ]),
    );
  }
}
