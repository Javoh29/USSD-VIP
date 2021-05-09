import 'package:flutter/material.dart';
import 'package:ussd_vip/utils/constants.dart';

Future<T> showLanguageDialog<T>(BuildContext context) {
  return showDialog(
      context: context,
      builder: (_) {
        return Dialog(
            backgroundColor: Colors.transparent,
            child: StatefulBuilder(
              builder: (context, setState) {
                return Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: mainColors[selectU],
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12))),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Image.asset(
                                'assets/images/ic_question.png',
                                height: 20,
                                width: 20,
                              ),
                            ),
                            Text(
                              lang ? 'Выберите язык' : 'Tilni tanlang',
                              style: kTextStyle(fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      RadioListTile(
                          value: true,
                          title: Text('Русский'),
                          activeColor: mainColors[selectU],
                          groupValue: lang,
                          onChanged: (v) {
                            setState(() => lang = v);
                            Navigator.pop(context);
                          }),
                      RadioListTile(
                          value: false,
                          title: Text('O`zbek tili'),
                          activeColor: mainColors[selectU],
                          groupValue: lang,
                          onChanged: (v) {
                            setState(() => lang = v);
                            Navigator.pop(context);
                          })
                    ],
                  ),
                );
              },
            ));
      });
}
