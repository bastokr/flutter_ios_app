import '../../../core/app_export.dart';

/// This class is used in the [maingrid_item_widget] screen.
class MaingridItemModel {
  MaingridItemModel({
    this.image,
    this.image1,
    this.fortyEight,
    this.cappucino,
    this.withChocolate,
    this.price,
    this.id,
  }) {
    image = image ?? Rx(ImageConstant.imgRectangle1706);
    image1 = image1 ?? Rx(ImageConstant.imgFurniturIconYellow700);
    fortyEight = fortyEight ?? Rx("4.8");
    cappucino = cappucino ?? Rx("Cappucino");
    withChocolate = withChocolate ?? Rx("with Chocolate");
    price = price ?? Rx(" 4.53");
    id = id ?? Rx("");
  }

  Rx<String>? image;

  Rx<String>? image1;

  Rx<String>? fortyEight;

  Rx<String>? cappucino;

  Rx<String>? withChocolate;

  Rx<String>? price;

  Rx<String>? id;
}
