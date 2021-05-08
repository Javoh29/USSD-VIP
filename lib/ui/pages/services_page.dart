import 'package:flutter/material.dart';
import 'package:ussd_vip/data/model/services_model.dart';
import 'package:ussd_vip/ui/widgets/dot_indicator.dart';
import 'package:ussd_vip/ui/widgets/ask_dialog.dart';
import 'package:ussd_vip/utils/call_ussd_code.dart';
import 'package:ussd_vip/utils/constants.dart';
import 'package:ussd_vip/data/providers/ussd_provider.dart';
import 'package:provider/provider.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({Key key}) : super(key: key);

  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  List<ServicesModel> _listModel = [];

  @override
  void initState() {
    changeStatusBar(mainColors[selectU], true);
    _listModel = context.read<UssdProvider>().listServices;
    super.initState();
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
            icon:
                Icon(Icons.arrow_back_ios_sharp, size: 18, color: Colors.white),
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
            tabs: _listModel
                .map(
                  (e) => Tab(
                    child: Text(
                      e.title.ru,
                      style: kTextStyle(fontWeight: FontWeight.w500, size: 13),
                    ),
                  ),
                )
                .toList(),
          ),
          title: Text(
            'Тарифы',
            style: kTextStyle(fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: TabBarView(
          children: _listModel
              .map((e) => ListView.builder(
                  shrinkWrap: false,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  itemCount: e.items.length,
                  itemBuilder: (context, index) => _items(e.items[index])))
              .toList(),
        ),
      ),
    );
  }

  Widget _items(Items model) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Color(0x30BFBFBF), blurRadius: 20, offset: Offset(0, 5))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.title.ru,
            style: kTextStyle(
                color: Colors.black87, size: 13, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              model.desc.ru,
              style: kTextStyle(
                  color: textGrey, fontWeight: FontWeight.w500, size: 12),
            ),
          ),
          if (model.code != null && model.code.isNotEmpty)
            Row(
            children: [
              Image.asset(
                'assets/images/ic_code.png',
                height: 15,
                width: 15,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Код:',
                    style: kTextStyle(
                        color: textGrey, size: 12, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  decoration: BoxDecoration(
                      color: Color(0xffF2F2F2),
                      borderRadius: BorderRadius.circular(3)),
                  child: SelectableText(
                    model.code,
                    style: kTextStyle(
                        color: mainColors[selectU],
                        size: 12,
                        fontWeight: FontWeight.w500),
                  ))
            ],
          ),
          if (model.codeOff != null && model.codeOff.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/ic_code.png',
                    height: 15,
                    width: 15,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Код отключение:',
                        style: kTextStyle(
                            color: textGrey, size: 12, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                      decoration: BoxDecoration(
                          color: Color(0xffF2F2F2),
                          borderRadius: BorderRadius.circular(3)),
                      child: SelectableText(
                        model.codeOff,
                        style: kTextStyle(
                            color: mainColors[selectU],
                            size: 12,
                            fontWeight: FontWeight.w500),
                      ))
                ],
              ),
            ),
          Row(
            children: [
              if (model.codeOff != null)
                Expanded(
                child: GestureDetector(
                  onTap: () => CallUssdCode.setUssdCode(model.codeOff),
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
                    decoration: BoxDecoration(
                      color: Color(0xffF2F2F2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text('Отключить', style: kTextStyle(color: textGreyDark, fontWeight: FontWeight.w500),),
                  ),
                ),
              ),
              if (model.code != null)
                Expanded(
                child: GestureDetector(
                  onTap: () => showAskDialog(context, model.code),
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(10, 30, 10, 5),
                    decoration: BoxDecoration(
                      color: mainColors[selectU],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text('Подключить', style: kTextStyle(fontWeight: FontWeight.w500),),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
