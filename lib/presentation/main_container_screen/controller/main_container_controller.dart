import 'package:isoflutterapp/core/app_export.dart';
import 'package:isoflutterapp/presentation/main_container_screen/models/main_container_model.dart';

/// A controller class for the MainContainerScreen.
///
/// This class manages the state of the MainContainerScreen, including the
/// current mainContainerModelObj
class MainContainerController extends GetxController {
  Rx<MainContainerModel> mainContainerModelObj = MainContainerModel().obs;
}
