import 'package:flutter/material.dart';

var lista = ["1", "2", "3"];

class HomePage extends StatelessWidget {
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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomListView(),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: lista.length,
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
                  Navigator.pushNamed(context, "/music");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          child: FlutterLogo(
                            size: 50,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Toosie Slide",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Drake",
                                style: TextStyle(
                                    color: Color(0xFF8ea1d6), fontSize: 18),
                              ),
                            ]),
                      ],
                    ),
                    Text(
                      "4:00",
                      style: TextStyle(color: Color(0xFF8ea1d6), fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
