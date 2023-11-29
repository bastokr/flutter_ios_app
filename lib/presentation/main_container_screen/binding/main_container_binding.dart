import '../controller/main_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MainContainerScreen.
///
/// This class ensures that the MainContainerController is created when the
/// MainContainerScreen is first loaded.
class MainContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainContainerController());
  }
}
