// ignore_for_file: avoid_redundant_argument_values

import 'package:carousel_slider/carousel_slider.dart';
import "package:flutter/material.dart";
import 'package:venuestar/custom-widget-tabs.widget.dart';
import 'package:venuestar/push/push_notifications.dart';
import 'package:venuestar/screens/learningpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(await initializeFlutterLocalNotifications()));
}

// ----------------------------------------- Custom Style ----------------------------------------- //

//Copyright (C) 2019 Potix Corporation. All Rights Reserved.
//History: Tue Apr 24 09:29 CST 2019
// Author: Jerry Chen

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  int _currentIndex = 0;

  List cardList = [
    const Item1(),
    const Item2(),
    const Item3(),
    const Item4(),
    const Item5()
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: MaterialApp(
        title: 'Flutter Card Carousel App',
        debugShowCheckedModeBanner: false,
        home: SafeArea(
            child: Stack(
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: true,
                height: MediaQuery.of(context).size.height,
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: cardList.map((card) {
                return Builder(builder: (BuildContext context) {
                  return Stack(
                    children: [
                      card,
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CustomWidgetExample(
                                  menuScreenContext: context,
                                ),
                              ),
                            );

                            //  Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                              height: 30,
                              width: 70,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15.0),
                                  bottomRight: Radius.circular(15.0),
                                  topLeft: Radius.circular(15.0),
                                  bottomLeft: Radius.circular(15.0),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  "SKIP",
                                  style: TextStyle(
                                      fontFamily: 'HelveticaNeue',
                                      fontSize: 15.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                });
              }).toList(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height / 6.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: map<Widget>(cardList, (index, url) {
                    return Container(
                      width: 30.0,
                      height: 10.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: _currentIndex == index
                            ? Colors.blueAccent
                            : Colors.grey,
                      ),
                    );
                  }),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
