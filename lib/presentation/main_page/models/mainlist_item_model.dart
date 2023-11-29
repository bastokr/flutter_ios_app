import '../../../core/app_export.dart';

/// This class is used in the [mainlist_item_widget] screen.
class MainlistItemModel {
  MainlistItemModel({
    this.frame,
    this.id,
  }) {
    frame = frame ?? Rx("Cappuccino");
    id = id ?? Rx("");
  }

  Rx<String>? frame;

  Rx<String>? id;
}
