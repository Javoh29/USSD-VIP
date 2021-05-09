import 'package:flutter/material.dart';
import 'package:ussd_vip/utils/call_ussd_code.dart';
import 'package:ussd_vip/utils/constants.dart';

Future<T> showAskDialog<T>(BuildContext context, String code) {
  return showDialog(
      context: context,
      builder: (_) {
        return Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                children: [
                  Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: mainColors[selectU],
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Image.asset('assets/images/ic_question.png', height: 20, width: 20,),
                        ),
                        Text(lang ? 'Вы уверены?' : 'Ishonchingiz komilmi?', style: kTextStyle(fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: Text(lang ? 'Вы действителбно хотите подключить данную услугу?' : 'Siz haqiqatan ham ushbu xizmatni yoqmoqchimisiz?', style: kTextStyle(color: Colors.black87, size: 15, fontWeight: FontWeight.w600), textAlign: TextAlign.center,),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                        color: mainColors[selectU],
                          onPressed: () => Navigator.pop(context), child: Text(lang ? 'Отмена' : 'Ortga', style: kTextStyle(fontWeight: FontWeight.w500),)),
                      RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                          color: mainColors[selectU],
                          onPressed: () {
                            CallUssdCode.setUssdCode(code);
                            Navigator.pop(context);
                          }, child: Text(lang ? 'Да' : 'Xa', style: kTextStyle(fontWeight: FontWeight.w500),))
                    ],
                  )
                ],
              ),
            ));
      });
}