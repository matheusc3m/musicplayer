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
        Text(
          "The Weekend",
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
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
            onPressed: () {},
          ),
          IconButton(
            splashRadius: 30,
            color: Color(0xFF474575),
            iconSize: 40,
            icon: Icon(
              Icons.fast_forward,
            ),
            onPressed: () {},
          )
        ]),
      ]),
    );
  }
}
