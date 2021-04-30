import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:ussd_vip/utils/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _imgList = [
    'assets/images/img_banner2.jpg',
    'assets/images/img_banner1.jpg',
    'assets/images/img_banner2.jpg',
    'assets/images/img_banner1.jpg',
  ];
  final pageIndexNotifier = ValueNotifier<int>(0);
  PageController _pageController = PageController(
      viewportFraction: 1, keepPage: true);
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      int p = pageIndexNotifier.value + 1;
      if (p > _imgList.length-1) {
        p = 0;
      }
      _pageController.jumpToPage(p);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    pageIndexNotifier.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: false,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(top: 10),
      children: [
        SizedBox(
          height: 115,
          child: PageView.builder(
              onPageChanged: (index) {
                pageIndexNotifier.value = index;
              },
              controller: _pageController,
              itemCount: _imgList.length,
              itemBuilder: (context, index) {
                return _itemBanner(_imgList[index]);
              }),
        ),
        PageViewIndicator(
          pageIndexNotifier: pageIndexNotifier,
          length: _imgList.length,
          normalBuilder: (_, index) =>
              Circle(
                size: 7,
                color: getColorIndicatorOne(),
              ),
          highlightedBuilder: (animation, index) =>
              ScaleTransition(
                scale: CurvedAnimation(
                    parent: animation,
                    curve: Curves.ease
                ),
                child: Circle(
                  size: 12,
                  color: getColorIndicatorTwo(),
                ),
              ),
        )
      ],
    );
  }

  Widget _itemBanner(String link) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), boxShadow: [
        BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 1))
      ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          link,
          fit: BoxFit.cover,
          height: 100,
        ),
      ),
    );
  }
}
