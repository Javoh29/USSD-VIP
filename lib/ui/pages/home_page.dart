
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ussd_vip/data/model/banner_model.dart';
import 'package:ussd_vip/data/providers/navigation_provider.dart';
import 'package:ussd_vip/data/providers/ussd_provider.dart';
import 'package:ussd_vip/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:ussd_vip/utils/routes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _imgLogoList = [
    'assets/images/logo_uzmobile',
    'assets/images/logo_ucell',
    'assets/images/logo_mobiuz',
    'assets/images/logo_beeline',
  ];
  final pageIndexNotifier = ValueNotifier<int>(0);
  CarouselController _carouselController = CarouselController();
  int _realIdx = selectU;

  @override
  void initState() {
    context.read<UssdProvider>().loadData(context: context);
    super.initState();
  }

  @override
  void dispose() {
    pageIndexNotifier.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<UssdProvider>(
      builder: (context, model, child) {
        return ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(top: 10),
          children: [
            if (model.listBanner != null && model.listBanner.isNotEmpty)
              CarouselSlider(
              options: CarouselOptions(
                height: 115,
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                autoPlayAnimationDuration: Duration(milliseconds: 600),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, _) {
                  pageIndexNotifier.value = index;
                },
              ),
              items: model.listBanner.map((e) => _itemBanner(e)).toList(),
            ),
            if (model.listBanner != null && model.listBanner.isNotEmpty)
              PageViewIndicator(
              pageIndexNotifier: pageIndexNotifier,
              length: model.listBanner != null ? model.listBanner.length : 0,
              normalBuilder: (_, index) => Circle(
                size: 7,
                color: mainColors[selectU],
              ),
              highlightedBuilder: (animation, index) => ScaleTransition(
                scale: CurvedAnimation(parent: animation, curve: Curves.ease),
                child: Circle(
                  size: 12,
                  color: indicatorColors[selectU],
                ),
              ),
            ),
            CarouselSlider.builder(
              itemCount: _imgLogoList.length,
              options: CarouselOptions(
                height: 80,
                viewportFraction: 0.40,
                initialPage: selectU,
                enlargeCenterPage: false,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  selectU = index;
                  context.read<NavigationProvider>().updateState();
                  model.loadData(context: context);
                  setState(() {});
                },
              ),
              carouselController: _carouselController,
              itemBuilder: (context, index, realIdx) =>
                  _itemLogo(_imgLogoList[index], index, realIdx),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 6,
                width: 35,
                decoration: BoxDecoration(
                    color: mainColors[selectU],
                    borderRadius: BorderRadius.circular(3)),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(15, 20, 15, 25),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xffF1F1F1),
                        offset: Offset(0, 2),
                        blurRadius: 10)
                  ]),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                            onTap: () => Navigator.pushNamed(context, Routes.internetPage).then((value) => changeStatusBar(Color(0xfff9f9f9), false)),
                            child: _itemButton('assets/images/ic_internet.png', 'Интернет')),
                        GestureDetector(
                            onTap: () => Navigator.pushNamed(context, Routes.minutesPage).then((value) => changeStatusBar(Color(0xfff9f9f9), false)),
                            child: _itemButton('assets/images/ic_clock.png', 'Минуты')),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                            onTap: () => Navigator.pushNamed(context, Routes.smsPage).then((value) => changeStatusBar(Color(0xfff9f9f9), false)),
                            child: _itemButton('assets/images/ic_sms.png', 'SMS')),
                        GestureDetector(
                            onTap: () => Navigator.pushNamed(context, Routes.tariffsPage).then((value) => changeStatusBar(Color(0xfff9f9f9), false)),
                            child: _itemButton('assets/images/ic_sim.png', 'Тарифы')),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                            onTap: () => Navigator.pushNamed(context, Routes.ussdPage).then((value) => changeStatusBar(Color(0xfff9f9f9), false)),
                            child: _itemButton('assets/images/ic_ussd.png', 'USSD коды')),
                        GestureDetector(
                            onTap: () => Navigator.pushNamed(context, Routes.servicesPage).then((value) => changeStatusBar(Color(0xfff9f9f9), false)),
                            child: _itemButton('assets/images/ic_diamond.png', 'Сервис')),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  Widget _itemButton(String link, String text) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Transform.rotate(
          angle: 0.06,
          child: Container(
            height: 110,
            width: 120,
            margin: EdgeInsets.only(bottom: 2, right: 2),
            decoration: BoxDecoration(
                color: secondColors[selectU],
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: indicatorColors[selectU],
                      offset: Offset(0, 5),
                      blurRadius: 15)
                ]),
          ),
        ),
        Container(
          height: 110,
          width: 120,
          decoration: BoxDecoration(
              color: mainColors[selectU],
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                link,
                height: 35,
                width: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 3),
                child: Text(
                  text,
                  style: kTextStyle(size: 12, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 12,
          width: 12,
          margin: EdgeInsets.only(top: 8, right: 8),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(6)),
        )
      ],
    );
  }

  Widget _itemLogo(String link, int index, int realIdx) {
    if (selectU == index) _realIdx = realIdx;
    return GestureDetector(
      onTap: () {
        if (_realIdx != realIdx) {
          if (_realIdx < realIdx)
            _carouselController.nextPage();
          else
            _carouselController.previousPage();
        }
      },
      child: Container(
        height: 60,
        width: 130,
        decoration: BoxDecoration(
            color: selectU == index ? mainColors[selectU] : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Color(0xffF1F1F1),
                  offset: Offset(0, 1),
                  blurRadius: 10)
            ]),
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Image.asset(
          selectU == index ? '${link}_1.png' : '$link.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _itemBanner(BannerModel model) {
    return GestureDetector(
      onTap: () => launch(model.link),
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 5),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 1))
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: model.imgUrl,
            height: 100,
            width: double.infinity,
            fit: BoxFit.cover,
            placeholder: (context, url) => Image.asset(
              'assets/images/img_def.jpg',
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            errorWidget: (context, url, error) => Image.asset(
              'assets/images/img_def.jpg',
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          )
        ),
      ),
    );
  }
}
