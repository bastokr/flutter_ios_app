import 'package:isoflutterapp/core/app_export.dart';
import 'package:isoflutterapp/presentation/main_page/models/main_model.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

/// A controller class for the MainPage.
///
/// This class manages the state of the MainPage, including the
/// current mainModelObj
class MainController extends GetxController {
  MainController(this.mainModelObj);
  late final WebViewController webcontroller;
  TextEditingController searchController = TextEditingController();

  Rx<MainModel> mainModelObj;

  SelectionPopupModel? selectedDropDownValue;

  @override
  void onInit() {
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    // TODO: implement onInit
    webcontroller = WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    webcontroller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onUrlChange: (UrlChange change) {
            debugPrint('url change to ${change.url}');
          },
        ),
      )
      ..addJavaScriptChannel(
        'sendMessage',
        onMessageReceived: (JavaScriptMessage message) {
          //  debugPrint(message.message);
          //    webcontroller.runJavaScript('fromAppToWeb("testflutter send")');
        },
      )
      ..loadRequest(Uri.parse('https://iukj.cafe24.com/chat/room.php'));

    // #docregion platform_features
    if (webcontroller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (webcontroller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }

  onSelected(dynamic value) {
    for (var element in mainModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    mainModelObj.value.dropdownItemList.refresh();
  }
}
