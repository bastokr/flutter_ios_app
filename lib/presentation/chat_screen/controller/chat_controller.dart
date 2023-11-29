import 'package:kwon_s_application9/core/app_export.dart';
import 'package:kwon_s_application9/presentation/detail_screen/models/detail_model.dart';

/// A controller class for the DetailScreen.
///
/// This class manages the state of the DetailScreen, including the
/// current detailModelObj
class ChatController extends GetxController {
  Rx<DetailModel> detailModelObj = DetailModel().obs;
}
