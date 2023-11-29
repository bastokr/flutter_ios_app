import 'package:kwon_s_application9/core/app_export.dart';
import 'package:kwon_s_application9/presentation/main_page/models/main_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the MainPage.
///
/// This class manages the state of the MainPage, including the
/// current mainModelObj
class MainController extends GetxController {
  MainController(this.mainModelObj);

  TextEditingController searchController = TextEditingController();

  Rx<MainModel> mainModelObj;

  SelectionPopupModel? selectedDropDownValue;

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
