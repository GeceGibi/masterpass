import 'dart:async';

import 'package:flutter/services.dart';

class Masterpass {
  static const MethodChannel _channel = MethodChannel('masterpass');
  static const EventChannel _eventChannel = EventChannel('masterpass/stream');

  static Future<dynamic> initialize(Map<String, dynamic> payload) async {
    return await _channel.invokeMethod('initialize', payload);
  }

  static Stream<dynamic> get stream {
    return _eventChannel
        .receiveBroadcastStream()
        .map<dynamic>((value) => value);
  }
}
