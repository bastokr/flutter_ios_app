import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:core';
import '../widgets/screen_select_dialog.dart';
import 'signaling.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class SseConnect {
  SseConnect() {}
  late final WebViewController webcontroller;
  Function()? onOpen;
  Function(dynamic msg)? onMessage;
  Function(int? code, String? reaso)? onClose;
  send(data) {
    //"{"type":"new","data":{"name":"Flutter android(localhost)","id":"838502","user_agent":"flutter-webrtc/android-plugin 0.0.1"}}"

    //if (_socket != null) {
    // _socket.add(data);
    print('send: $data');
    // }
  }

  connect() async {
    try {
      //_socket = await WebSocket.connect(_url);
      onOpen!();
    } catch (e) {
      onClose?.call(500, e.toString());
    }
  }

  close() {
    print("close");
  }
}
