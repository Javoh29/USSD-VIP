import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ussd_vip/data/providers/navigation_provider.dart';
import 'package:ussd_vip/ui/pages/home_page.dart';
import 'package:ussd_vip/ui/pages/settings_page.dart';
import 'package:ussd_vip/utils/constants.dart';

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
    changeStatusBar(Color(0xfff9f9f9), false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, model, child) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
                    padding: EdgeInsets.only(bottom: 50),
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
                    child: Expanded(
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
                                    child: Image.asset('assets/images/ic_home${model.currentName == PageName.home ? '_${selectU.toString()}': ''}.png', height: 20, width: 20,),
                                  ),
                                  Text('Home', style: kTextStyle(size: 8, color: model.currentName == PageName.home ? mainColors[selectU] : textGrey))
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Image.asset('assets/images/ic_balance.png', height: 20, width: 20,),
                                  ),
                                  Text('Balance', style: kTextStyle(size: 8, color: textGrey),)
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Image.asset('assets/images/ic_profile.png', height: 20, width: 20,),
                                  ),
                                  Text('Profile', style: kTextStyle(size: 8, color: textGrey))
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
                                    child: Image.asset('assets/images/ic_setting${model.currentName == PageName.settings ? '_${selectU.toString()}': ''}.png', height: 20, width: 20,),
                                  ),
                                  Text('Settings', style: kTextStyle(size: 8, color: model.currentName == PageName.settings ? mainColors[selectU] : textGrey))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
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
