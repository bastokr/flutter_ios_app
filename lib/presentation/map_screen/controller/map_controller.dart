import 'package:kwon_s_application9/core/app_export.dart';
import 'package:kwon_s_application9/presentation/map_screen/models/map_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter/material.dart';

/// A controller class for the MapScreen.
///
/// This class manages the state of the MapScreen, including the
/// current mapModelObj
class MapController extends GetxController with CodeAutoFill {
  Rx<TextEditingController> otpController = TextEditingController().obs;

  Rx<MapModel> mapModelObj = MapModel().obs;

  @override
  void codeUpdated() {
    otpController.value.text = code ?? '';
  }

  @override
  void onInit() {
    super.onInit();
    listenForCode();
  }
}
