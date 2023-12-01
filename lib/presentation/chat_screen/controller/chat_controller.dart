import 'package:isoflutterapp/core/app_export.dart';
import 'package:isoflutterapp/presentation/detail_screen/models/detail_model.dart';

/// A controller class for the DetailScreen.
///
/// This class manages the state of the DetailScreen, including the
/// current detailModelObj
class ChatController extends GetxController {
  Rx<DetailModel> detailModelObj = DetailModel().obs;
}
