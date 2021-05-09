import 'package:flutter/material.dart';
import 'package:ussd_vip/data/model/ussd_model.dart';
import 'package:ussd_vip/ui/widgets/ask_dialog.dart';
import 'package:ussd_vip/utils/constants.dart';
import 'package:ussd_vip/data/providers/ussd_provider.dart';
import 'package:provider/provider.dart';

class UssdPage extends StatefulWidget {
  const UssdPage({Key key}) : super(key: key);

  @override
  _UssdPageState createState() => _UssdPageState();
}

class _UssdPageState extends State<UssdPage> {
  UssdModel _model;

  @override
  void initState() {
    changeStatusBar(mainColors[selectU], true);
    _model = context.read<UssdProvider>().modelUssd;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9f9f9),
      appBar: AppBar(
        backgroundColor: mainColors[selectU],
        elevation: 10,
        shadowColor: Colors.black87,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp, size: 18, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          lang ? 'USSD коды' : 'USSD ko\'lar',
          style: kTextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: _model != null ? ListView.builder(
          itemCount: _model.items.length,
          padding: EdgeInsets.symmetric(vertical: 10),
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => _item(_model.items[index])) : SizedBox.shrink(),
    );
  }

  Widget _item(Items model) {
    return GestureDetector(
      onTap: () {
        if (model.code != null && model.code.isNotEmpty) {
          showAskDialog(context, model.code);
        }
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Color(0x30BFBFBF), blurRadius: 20, offset: Offset(0, 5))
            ]),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              child: Container(
                width: 90,
                decoration: BoxDecoration(
                  color: mainColors[selectU],
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
                ),
                alignment: Alignment.center,
                child: Text(model.code, style: kTextStyle(size: 13, fontWeight: FontWeight.w600),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(120, 10, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(lang ? model.title.ru : model.title.uz, style: kTextStyle(color: textGreyDark, fontWeight: FontWeight.w600, size: 14),),
                  SizedBox(height: 10,),
                  Text(lang ? model.desc.ru : model.desc.uz, style: kTextStyle(color: textGrey, fontWeight: FontWeight.w500, size: 13),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
