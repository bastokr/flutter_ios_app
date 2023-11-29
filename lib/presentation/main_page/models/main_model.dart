import 'package:kwon_s_application9/data/models/selectionPopupModel/selection_popup_model.dart';
import '../../../core/app_export.dart';
import 'mainlist_item_model.dart';
import 'maingrid_item_model.dart';

/// This class defines the variables used in the [main_page],
/// and is typically used to hold data that is passed between different parts of the application.
class MainModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Item One",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Item Two",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Item Three",
    )
  ]);

  Rx<List<MainlistItemModel>> mainlistItemList = Rx([
    MainlistItemModel(frame: "Cappuccino".obs),
    MainlistItemModel(frame: "Machiato".obs),
    MainlistItemModel(frame: "Latte".obs),
    MainlistItemModel(frame: "Americano".obs)
  ]);

  Rx<List<MaingridItemModel>> maingridItemList = Rx([
    MaingridItemModel(
        image: ImageConstant.imgRectangle1706.obs,
        image1: ImageConstant.imgFurniturIconYellow700.obs,
        fortyEight: "4.8".obs,
        cappucino: "Cappucino".obs,
        withChocolate: "with Chocolate".obs,
        price: " 4.53".obs),
    MaingridItemModel(
        image: ImageConstant.imgRectangle1707.obs,
        image1: ImageConstant.imgFurniturIconYellow700.obs,
        fortyEight: "4.8".obs,
        cappucino: "Cappucino".obs,
        withChocolate: "with Chocolate".obs,
        price: " 4.53".obs),
    MaingridItemModel(
        image: ImageConstant.imgRectangle1706132x141.obs,
        cappucino: "Cappucino".obs,
        withChocolate: "with Chocolate".obs,
        price: " 4.53".obs),
    MaingridItemModel(
        image: ImageConstant.imgRectangle1707132x142.obs,
        cappucino: "Cappucino".obs,
        withChocolate: "with Oat Milk".obs,
        price: " 3.90".obs)
  ]);
}
