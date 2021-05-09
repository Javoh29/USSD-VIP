import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ussd_vip/ui/widgets/language_dialog.dart';
import 'package:ussd_vip/utils/constants.dart';
import 'package:ussd_vip/utils/call_ussd_code.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 90,
            width: 90,
            margin: EdgeInsets.only(top: 30, bottom: 10),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffF1F1F1),
                  blurRadius: 20,
                  offset: Offset(0, 5)
                )
              ]
            ),
            child: Image.asset('assets/images/app_logo.png'),
          ),
        ),
        Align(
            alignment: Alignment.center,
            child: Text('USSD VIP v1.0.1', style: kTextStyle(size: 12, color: Colors.grey),)),
        Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 20),
          child: GestureDetector(
            onTap: () => launch('https://telegram.me/umsuzb2'),
              child: _item('assets/images/ic_telegram_${selectU.toString()}.png', lang ? 'Telegram канал' : 'Telegram kanal')),
        ),
        GestureDetector(
          onTap: () {
            switch (selectU) {
              case 0: CallUssdCode.setUssdCode('1099'); break;
              case 1: CallUssdCode.setUssdCode('8123'); break;
              case 2: CallUssdCode.setUssdCode('0890'); break;
              case 3: CallUssdCode.setUssdCode('0611'); break;
            }
          },
            child: _item('assets/images/ic_operator_${selectU.toString()}.png', lang ? 'Связаться с оператором' : 'Operator bilan bog`lanish')),
        GestureDetector(
          onTap: () => CallUssdCode.setUssdCode('+998977440448'),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: _item('assets/images/ic_phone_${selectU.toString()}.png', lang ? 'Связаться с нами' : 'Biz bilan bog`lanish'),
          ),
        ),
        GestureDetector(
          onTap: () {
            switch (selectU) {
              case 0: CallUssdCode.setUssdCode('*100*4#'); break;
              case 1: CallUssdCode.setUssdCode('*450#'); break;
              case 2: CallUssdCode.setUssdCode('*150#'); break;
              case 3: CallUssdCode.setUssdCode('*148#'); break;
            }
          },
            child: _item('assets/images/ic_user_${selectU.toString()}.png', lang ? 'Мой номер' : 'Mening raqamim')),
        GestureDetector(
          onTap: () => showLanguageDialog(context).then((value) => setState((){})),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: _item('assets/images/ic_language_${selectU.toString()}.png', lang ? 'Язык' : 'Tilni o`zgartirish'),
          ),
        ),
        GestureDetector(
          onTap: () => launch('https://play.google.com/store/apps/developer?id=UMS+Co-Worker+%28Dealer%29'),
            child: _item('assets/images/ic_market_${selectU.toString()}.png', lang ? 'Другие наши продукты' : 'Bizning boshqa dasturlarimiz')),
      ],
    );
  }

  Widget _item(String link, String text) {
    return Container(
      height: 55,
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.symmetric(horizontal: 20
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Color(0xffF1F1F1),
                blurRadius: 15,
                offset: Offset(0, 3)
            )
          ]
      ),
      child: Row(
        children: [
          Image.asset(link, height: 20, width: 20),
          SizedBox(width: 15,),
          Text(text, style: kTextStyle(color: mainColors[selectU], fontWeight: FontWeight.w500),)
        ],
      ),
    );
  }
}
