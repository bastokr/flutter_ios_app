import 'dart:convert';

import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:core';
import '../../data/apiClient/api_client.dart';
import '../widgets/screen_select_dialog.dart';
import 'signaling.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class SseConnect {
  SseConnect() {}
  Function()? onOpen;
  // Function(dynamic msg)? onMessage;
  Function(int? code, String? reaso)? onClose;
  Future send(data) async {
    var jsonData = jsonDecode(data);
    // https: //iukj.cafe24.com/msite/sheetmate.php?group=%ED%8C%BB%EB%B2%84%ED%8B%80%EB%9F%AC&MENU_ID=MENU_MGT_S005_S108&menu=%EC%98%A4%ED%94%88%EC%B1%97&site=petbutler

    //"{"type":"new","data":{"name":"Flutter android(localhost)","id":"838502","user_agent":"flutter-webrtc/android-plugin 0.0.1"}}"

    Map<String, dynamic> postData = {
      'mb1': jsonData["type"],
      'mb2': jsonEncode(jsonData["data"]),
    };

    var rtnValue =
        await NetworkHelper(url: '/SETDATA/petbutler/MENU_MGT_S005_S108')
            .getPostData(postData);
    print(rtnValue);
  }

  Future onMessage(data) async {
    var jsonData = jsonDecode(data);

    Map<String, dynamic> postData = {
      'mb1': jsonData["type"],
      'mb2': jsonEncode(jsonData["data"]),
    };

    var rtnValue =
        await NetworkHelper(url: '/SETDATA/petbutler/MENU_MGT_S005_S110')
            .getPostData(postData);
    print(rtnValue);
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
