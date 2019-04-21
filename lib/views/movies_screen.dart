import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MoviesScreen extends StatefulWidget {
  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _pickLocationCell(),
          _carouselMoviesCell(),
          _nowShowingCell(),
          _shareCodeAndGetPointCell(),
          _videosCell(),
          Divider(height: 3, ),
          _spotLightCell(),
          Divider(height: 3, ),
          _comingSoonCell(),
        ],
      ),
    );
  }

  _pickLocationCell() {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(250, 250, 251, 1)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Image.asset(
              "images/icon_location_pulltheater.png",
              fit: BoxFit.contain,
              width: 16,
              height: 16,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "JAKARTA",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,),
                ),
              ),
            ),
            Image.asset(
              "images/ic_triangle_drop_down.png",
              width: 16,
              height: 16,
            )
          ],
        ),
      ),
    );
  }

  _carouselMoviesCell() {
    return CarouselSlider(
      height: 150,
      viewportFraction: 1.0,
      scrollDirection: Axis.horizontal,
      autoPlay: true,
      aspectRatio: 16 / 9,
      initialPage: 0,
      enableInfiniteScroll: true,
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/bg_my_loyal_tix_detail.png"),
                        fit: BoxFit.fill)),
                child: Center(
                    child: Text(
                  'text $i',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                )));
          },
        );
      }).toList(),
    );
  }

  _nowShowingCell() {
    return Column(
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 16, top: 24, right: 16, bottom: 16),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Now Showing",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Text(
                "More",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              Image.asset(
                "images/ic_chevron_right_grey.png",
                width: 24,
                height: 24,
              ),
            ],
          ),
        ),
        _nowShowingCarousel()
      ],
    );
  }

  _nowShowingCarousel() {
    return CarouselSlider(
      height: 320,
      viewportFraction: 0.5,
      scrollDirection: Axis.horizontal,
      autoPlay: false,
      aspectRatio: 16 / 9,
      initialPage: 0,
      enableInfiniteScroll: true,
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("images/bg_my_loyal_tix_detail.png"),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Judul Film $i",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Text(
                    "Genre film $i",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                )),
              ],
            );
          },
        );
      }).toList(),
    );
  }

  _shareCodeAndGetPointCell() {
    return Container(
      color: Color.fromRGBO(243, 218, 143, 1),
      padding: EdgeInsets.only(left: 16, top: 7, right: 16, bottom: 7),
      child: Row(
        children: <Widget>[
          Center(
              child: Image.asset(
            "images/ic_invitation_code_homepage.png",
            width: 12,
            height: 12,
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "SHARE CODE & GET POINT!",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          )),
          Image.asset(
            "images/ic_home_page_more_button.png",
            width: 12,
            height: 12,
          ),
        ],
      ),
    );
  }

  _videosCell() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              "Videos",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _videosItem(),
                _videosItem(),
                _videosItem(),
                _videosItem(),
                _videosItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _videosItem() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 0),
      child: Column(
        children: <Widget>[
          Container(
            width: 200,
            height: 120,
            margin: EdgeInsets.only(top: 20, bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                    image: AssetImage("images/bg_my_loyal_tix_detail.png"),
                    fit: BoxFit.cover)),
            child: Center(
              child: Image.asset(
                "images/ic_play_dark.png",
                width: 32,
                height: 32,
              ),
            ),
          ),
          Container(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "John Wick: Chapter 3 Prebalium End Game",
                  maxLines: 2,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Text(
                    "2K plays | 19 April 2019",
                    maxLines: 1,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _spotLightCell() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, top: 20,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              "Spotlight",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _spotlightItem(),
                _spotlightItem(),
                _spotlightItem(),
                _spotlightItem(),
                _spotlightItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _spotlightItem() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 0, top: 20),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: <Widget>[
            Container(
                width: 300,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                    image: DecorationImage(
                        image: AssetImage("images/bg_my_loyal_tix_detail.png"),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "3 Film Indonesia Yang Sayang Dilewatkan!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                        maxLines: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          "Rumput Tetangga",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                          maxLines: 1,
                        ),
                      )
                    ],
                  ),
                )),
            Container(
              width: 300,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "ASLI INDONESIA",
                      maxLines: 1,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "15",
                        maxLines: 1,
                        style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "April 2019",
                        maxLines: 1,
                        style:
                        TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _comingSoonCell() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Coming Soon",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "More",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                Image.asset(
                  "images/ic_chevron_right_grey.png",
                  width: 24,
                  height: 24,
                ),
              ],
            )
          ),
          Container(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _comingSoonItem(),
                _comingSoonItem(),
                _comingSoonItem(),
                _comingSoonItem(),
                _comingSoonItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _comingSoonItem() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 0),
      child: Column(
        children: <Widget>[
          Container(
            width: 200,
            height: 200,
            margin: EdgeInsets.only(top: 20, bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                    image: AssetImage("images/bg_my_loyal_tix_detail.png"),
                    fit: BoxFit.cover)),
          ),
          Container(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Avengers : End Game",
                  maxLines: 2,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Text(
                    "Fantasy, Trailer, Action, Comedy",
                    maxLines: 1,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}