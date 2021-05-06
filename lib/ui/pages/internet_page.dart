import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ussd_vip/data/model/internet_model.dart';
import 'package:ussd_vip/ui/widgets/dot_indicator.dart';
import 'package:ussd_vip/utils/constants.dart';

class InternetPage extends StatefulWidget {
  const InternetPage({Key key}) : super(key: key);

  @override
  _InternetPageState createState() => _InternetPageState();
}

class _InternetPageState extends State<InternetPage> {

  List<InternetModel> _listModel = [];

  @override
  void initState() {
    changeStatusBar(mainColors[selectU], true);
    loadData();
    super.initState();
  }

  Future<void> loadData() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/data/${fileNames[selectU]}");
    var j = jsonDecode(data);
    _listModel = [for (final item in j['internet']['sections']) InternetModel.fromJson(item)];
    setState(() {});
    // Directory directory = await getApplicationDocumentsDirectory();
    // var f = File("${directory.path}/assets/data/mobi.json");
    // String text = await f.readAsString();
    // print("JSON: $text");
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _listModel.length,
      child: Scaffold(
        backgroundColor: Color(0xfff9f9f9),
        appBar: AppBar(
          backgroundColor: mainColors[selectU],
          elevation: 10,
          shadowColor: Colors.black87,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_sharp, size: 18, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          bottom: TabBar(
            labelPadding: EdgeInsets.only(bottom: 5, left: 15, right: 15),
            indicator: DotIndicator(
              distanceFromCenter: 12,
              radius: 2.5,
              paintingStyle: PaintingStyle.fill,
            ),
            isScrollable: true,
            tabs: _listModel.map((e) => Tab(child: Text(e.title.ru, style: kTextStyle(fontWeight: FontWeight.w500, size: 13),),),).toList(),
          ),
          title: Text('Интернет пакеты', style: kTextStyle(fontWeight: FontWeight.w600),),
          centerTitle: true,
        ),
        body: TabBarView(
          children: _listModel.map((e) => ListView.builder(
              shrinkWrap: false,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: 20, bottom: 20),
              itemCount: e.items.length,
              itemBuilder: (context, index) => _items(e.items[index])
          )).toList(),
        ),
      ),
    );
  }


  Widget _items(Items model) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(15, 30, 15, 10),
          margin: EdgeInsets.fromLTRB(20, 20, 20, 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color(0x30BFBFBF),
                blurRadius: 20,
                offset: Offset(0, 5)
              )
            ]
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset('assets/images/ic_price.png', height: 15, width: 15,),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text('Стоимость:', style: kTextStyle(color: textGreyDark, size: 12, fontWeight: FontWeight.w500),),
                    ),
                  ),
                  Text('${numFormat.format(model.price)} uzs', style: kTextStyle(color: mainColors[selectU], size: 12, fontWeight: FontWeight.w500),)
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Image.asset('assets/images/ic_package.png', height: 15, width: 15,),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text('Количество мб:', style: kTextStyle(color: textGreyDark, size: 12, fontWeight: FontWeight.w500),),
                      ),
                    ),
                    Text(model.title.ru, style: kTextStyle(color: mainColors[selectU], size: 12, fontWeight: FontWeight.w500),)
                  ],
                ),
              ),
              Row(
                children: [
                  Image.asset('assets/images/ic_calendar.png', height: 15, width: 15,),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text('Срок:', style: kTextStyle(color: textGreyDark, size: 12, fontWeight: FontWeight.w500),),
                    ),
                  ),
                  Text('${model.period} дней', style: kTextStyle(color: mainColors[selectU], size: 12, fontWeight: FontWeight.w500),)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6, bottom: 3),
                child: Row(
                  children: [
                    Image.asset('assets/images/ic_code.png', height: 15, width: 15,),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text('Код:', style: kTextStyle(color: textGreyDark, size: 12, fontWeight: FontWeight.w500),),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                        decoration: BoxDecoration(
                          color: Color(0xffF2F2F2),
                          borderRadius: BorderRadius.circular(3)
                        ),
                        child: SelectableText(model.code, style: kTextStyle(color: mainColors[selectU], size: 12, fontWeight: FontWeight.w500),))
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          child: Container(
            height: 35,
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: mainColors[selectU],
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 20,
                  offset: Offset(0, 7)
                )
              ]
            ),
            alignment: Alignment.center,
            child: Text(model.title.ru, style: kTextStyle(size: 18, fontWeight: FontWeight.w500),),
          ),
        )
      ],
    );
  }

}
