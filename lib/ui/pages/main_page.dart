import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ussd_vip/data/providers/navigation_provider.dart';
import 'package:ussd_vip/data/providers/ussd_provider.dart';
import 'package:ussd_vip/ui/pages/home_page.dart';
import 'package:ussd_vip/ui/pages/settings_page.dart';
import 'package:ussd_vip/utils/call_ussd_code.dart';
import 'package:ussd_vip/utils/constants.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  Widget _getPage(PageName name) {
    switch (name) {
      case PageName.home:
        return HomePage();
      case PageName.settings:
        return SettingsPage();
      default:
        return HomePage();
    }
  }

  @override
  void initState() {
    if (!kIsWeb)
      context.read<UssdProvider>().getVersion();
    changeStatusBar(Color(0xfff9f9f9), false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, model, child) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: _getPage(model.currentName),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffF1F1F1),
                          offset: Offset(0, -2),
                          blurRadius: 5
                        )
                      ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            model.setPageName(PageName.home);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Image.asset('assets/images/ic_home${model.currentName == PageName.home ? '_${selectU.toString()}': ''}.png', height: 23, width: 23,),
                                ),
                                Text('Home', style: kTextStyle(size: 10, color: model.currentName == PageName.home ? mainColors[selectU] : textGrey))
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            switch (selectU) {
                              case 0: CallUssdCode.setUssdCode('*107#'); break;
                              case 1: CallUssdCode.setUssdCode('*100#'); break;
                              case 2: CallUssdCode.setUssdCode('*100#'); break;
                              case 3: CallUssdCode.setUssdCode('*102#'); break;
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Image.asset('assets/images/ic_balance.png', height: 23, width: 23,),
                                ),
                                Text('Balance', style: kTextStyle(size: 10, color: textGrey),)
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            switch (selectU) {
                              case 0: launch('https://cabinet.uztelecom.uz/ps/scc/login.php'); break;
                              case 1: launch('https://my.ucell.uz/Account/Login?ReturnUrl=%2f'); break;
                              case 2: launch('https://ip.mobi.uz/selfcare/'); break;
                              case 3: launch('https://beeline.uz/uz'); break;
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Image.asset('assets/images/ic_profile.png', height: 23, width: 23,),
                                ),
                                Text('Profile', style: kTextStyle(size: 10, color: textGrey))
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            model.setPageName(PageName.settings);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Image.asset('assets/images/ic_setting${model.currentName == PageName.settings ? '_${selectU.toString()}': ''}.png', height: 23, width: 23,),
                                ),
                                Text('Settings', style: kTextStyle(size: 10, color: model.currentName == PageName.settings ? mainColors[selectU] : textGrey))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
