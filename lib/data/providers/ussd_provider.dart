import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ussd_vip/data/model/internet_model.dart';
import 'package:ussd_vip/data/model/minutes_model.dart';
import 'package:ussd_vip/data/model/services_model.dart';
import 'package:ussd_vip/data/model/sms_model.dart';
import 'package:ussd_vip/data/model/tariffs_model.dart';
import 'package:ussd_vip/data/model/banner_model.dart';
import 'package:ussd_vip/data/model/ussd_model.dart';
import 'package:ussd_vip/utils/constants.dart';
import 'package:http/http.dart' as http;

class UssdProvider with ChangeNotifier {

  List<InternetModel> _listInternet = [];
  List<MinutesModel> _listMinutes = [];
  List<ServicesModel> _listServices = [];
  List<SmsModel> _listSms = [];
  List<TariffsModel> _listTariffs = [];
  List<BannerModel> _listBanner = [];
  UssdModel _modelUssd;
  SharedPreferences prefs;

  Future<void> loadData({BuildContext context}) async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
    try {
      var pData = prefs.getString(fileNames[selectU]);
      if (pData != null && pData.isNotEmpty) {
        var jData = jsonDecode(pData);
        _listInternet = [for (final item in jData['internet']['sections']) InternetModel.fromJson(item)];
        _listMinutes = [for (final item in jData['minutes']['sections']) MinutesModel.fromJson(item)];
        _listServices = [for (final item in jData['services']['sections']) ServicesModel.fromJson(item)];
        _listSms = [for (final item in jData['sms']['sections']) SmsModel.fromJson(item)];
        _listTariffs = [for (final item in jData['tariffs']['sections']) TariffsModel.fromJson(item)];
        _listBanner = [for (final item in jData['images']) BannerModel.fromJson(item)];
        _modelUssd = UssdModel.fromJson(jData['ussd']['sections']);
      } else {
        String data = await DefaultAssetBundle.of(context).loadString("assets/data/${fileNames[selectU]}.json");
        var j = jsonDecode(data);
        _listInternet = [for (final item in j['internet']['sections']) InternetModel.fromJson(item)];
        _listMinutes = [for (final item in j['minutes']['sections']) MinutesModel.fromJson(item)];
        _listServices = [for (final item in j['services']['sections']) ServicesModel.fromJson(item)];
        _listSms = [for (final item in j['sms']['sections']) SmsModel.fromJson(item)];
        _listTariffs = [for (final item in j['tariffs']['sections']) TariffsModel.fromJson(item)];
        _listBanner = [for (final item in j['images']) BannerModel.fromJson(item)];
        _modelUssd = UssdModel.fromJson(j['ussd']['sections']);
      }
      notifyListeners();
    } catch(e) {
      print("BAG: $e");
    }
  }

  Future<void> getVersion() async {
    prefs = await SharedPreferences.getInstance();
    String ver = prefs.getString('ussd_ver');
    try {
      var url = Uri.parse('https://raw.githubusercontent.com/Javoh29/Mobiuz/master/USSD_VIP/version');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        prefs.setString('ussd_ver', response.body.toString());
      }
      if (ver != null && ver.isNotEmpty && ver != response.body.toString()) {
        var data1 = await http.get(Uri.parse('https://raw.githubusercontent.com/Javoh29/Mobiuz/master/USSD_VIP/uzmobile.json'));
        if (data1.statusCode == 200 && data1.body.isNotEmpty) {
          var data2 = await http.get(Uri.parse('https://raw.githubusercontent.com/Javoh29/Mobiuz/master/USSD_VIP/ucell.json'));
          if (data2.statusCode == 200 && data2.body.isNotEmpty) {
            var data3 = await http.get(Uri.parse('https://raw.githubusercontent.com/Javoh29/Mobiuz/master/USSD_VIP/mobiuz.json'));
            if (data3.statusCode == 200 && data3.body.isNotEmpty) {
              var data4 = await http.get(Uri.parse('https://raw.githubusercontent.com/Javoh29/Mobiuz/master/USSD_VIP/beeline.json'));
              if (data4.statusCode == 200 && data4.body.isNotEmpty) {
                prefs.setString('uzmobile', data1.body);
                prefs.setString('ucell', data2.body);
                prefs.setString('mobiuz', data3.body);
                prefs.setString('beeline', data4.body);
                loadData();
              }
            }
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }

  UssdModel get modelUssd => _modelUssd;

  List<BannerModel> get listBanner => _listBanner;

  List<TariffsModel> get listTariffs => _listTariffs;

  List<SmsModel> get listSms => _listSms;

  List<ServicesModel> get listServices => _listServices;

  List<MinutesModel> get listMinutes => _listMinutes;

  List<InternetModel> get listInternet => _listInternet;
}