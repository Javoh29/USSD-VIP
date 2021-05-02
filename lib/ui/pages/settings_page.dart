import 'package:flutter/material.dart';
import 'package:ussd_vip/utils/constants.dart';

class SettingsPage extends StatelessWidget {
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
            padding: EdgeInsets.only(top: 5),
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

      ],
    );
  }

  Widget _item(String link, String text) {
    return Container(
      height: 55,
      padding: EdgeInsets.symmetric(horizontal: 15),
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

        ],
      ),
    );
  }
}
