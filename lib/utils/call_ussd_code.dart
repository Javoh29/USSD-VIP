import 'package:flutter/services.dart';

class CallUssdCode {
  static const MethodChannel _channel = const MethodChannel('com.range.tutto/callIntent');

  static Future<void> setUssdCode(String code) =>
      _channel.invokeMethod('callIntent', {
        'code': code
      });

}