import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_launcher/url_launcher.dart';

class CallUssdCode {
  static const MethodChannel _channel = const MethodChannel('com.range.tutto/callIntent');

  static Future<void> setUssdCode(String code) async {
    if (kIsWeb || Platform.isIOS) {
      launch("tel:${code.replaceAll("#", Uri.encodeComponent("#"))}");
    } else if (Platform.isAndroid) {
      _channel.invokeMethod('callIntent', {
        'code': code
      });
    }
  }

}