import 'controller/main_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:kwon_s_application9/core/app_export.dart';
import 'package:kwon_s_application9/presentation/main_page/main_page.dart';
import 'package:kwon_s_application9/widgets/custom_bottom_bar.dart';

class MainContainerScreen extends GetWidget<MainContainerController> {
  const MainContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Navigator(
                key: Get.nestedKey(1),
                initialRoute: AppRoutes.mainPage,
                onGenerateRoute: (routeSetting) => GetPageRoute(
                    page: () => getCurrentPage(routeSetting.name!),
                    transition: Transition.noTransition)),
            bottomNavigationBar: _buildBottomBar()));
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Get.toNamed(getCurrentRoute(type), id: 1);
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Iconlybulkhome:
        return AppRoutes.mainPage;
      case BottomBarEnum.Iconlybulkheart:
        return "/";
      case BottomBarEnum.Iconlybulkbag:
        return "/";
      case BottomBarEnum.Iconlybulknotification:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.mainPage:
        return MainPage();
      default:
        return DefaultWidget();
    }
  }
}
