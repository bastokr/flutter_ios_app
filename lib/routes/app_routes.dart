import 'package:kwon_s_application9/presentation/map_screen/map_screen.dart';
import 'package:kwon_s_application9/presentation/map_screen/binding/map_binding.dart';
import 'package:kwon_s_application9/presentation/home_screen/home_screen.dart';
import 'package:kwon_s_application9/presentation/home_screen/binding/home_binding.dart';
import 'package:kwon_s_application9/presentation/main_container_screen/main_container_screen.dart';
import 'package:kwon_s_application9/presentation/main_container_screen/binding/main_container_binding.dart';
import 'package:kwon_s_application9/presentation/detail_screen/detail_screen.dart';
import 'package:kwon_s_application9/presentation/detail_screen/binding/detail_binding.dart';
import 'package:kwon_s_application9/presentation/order_screen/order_screen.dart';
import 'package:kwon_s_application9/presentation/order_screen/binding/order_binding.dart';
import 'package:kwon_s_application9/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:kwon_s_application9/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String mapScreen = '/map_screen';

  static const String homeScreen = '/home_screen';

  static const String mainPage = '/main_page';

  static const String mainContainerScreen = '/main_container_screen';

  static const String detailScreen = '/detail_screen';

  static const String orderScreen = '/order_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: mapScreen,
      page: () => MapScreen(),
      bindings: [
        MapBinding(),
      ],
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      bindings: [
        HomeBinding(),
      ],
    ),
    GetPage(
      name: mainContainerScreen,
      page: () => MainContainerScreen(),
      bindings: [
        MainContainerBinding(),
      ],
    ),
    GetPage(
      name: detailScreen,
      page: () => DetailScreen(),
      bindings: [
        DetailBinding(),
      ],
    ),
    GetPage(
      name: orderScreen,
      page: () => OrderScreen(),
      bindings: [
        OrderBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => HomeScreen(),
      bindings: [
        MapBinding(),
      ],
    )
  ];
}