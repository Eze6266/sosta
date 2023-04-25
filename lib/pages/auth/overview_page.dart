import 'package:flutter/material.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';

import '../../components/page_two.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key});
  @override
  OverviewPageState createState() => OverviewPageState();
}

class OverviewPageState extends State<OverviewPage> {
  var welcomeState = false;

  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      setState(() {
        welcomeState = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Container(
              decoration: BoxDecoration(color: Colors.transparent),
              child: !welcomeState
                  ? Container(
                      decoration: BoxDecoration(color: Colors.white),
                      child: Center(
                        child: Image.asset('asset/images/overview.gif'),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(color: Colors.white),
                      child: ListView(
                        children: [
                          CarouselSlider(
                            items: const [
                              // PageOne(
                              //   bgColor: Color(0xffB430E9),
                              //   bgColor2: Color(0xff530074),
                              //   image: 'asset/images/pageOne.png',
                              // ),
                              PageTwo(
                                  bgColor: Color(0xffFFD9B1),
                                  bgColor2: Color(0xffFF8E1B),
                                  image: 'asset/images/pageTwo.png'),
                              // PageTwo(
                              //     bgColor: Color(0xff530074),
                              //     bgColor2: Color(0xff29002E),
                              //     image: 'asset/images/pageThree.png'),
                            ],
                            options: CarouselOptions(
                              viewportFraction: 1.0,
                              autoPlayInterval: const Duration(seconds: 5),
                              height: MediaQuery.of(context).size.height,
                              autoPlay: true,
                            ),
                          )
                        ],
                      ),
                    )),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
