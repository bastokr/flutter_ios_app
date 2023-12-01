import '../controller/main_controller.dart';
import '../models/mainlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:isoflutterapp/core/app_export.dart';

// ignore: must_be_immutable
class MainlistItemWidget extends StatelessWidget {
  MainlistItemWidget(
    this.mainlistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  MainlistItemModel mainlistItemModelObj;

  var controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 121.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: 121.h,
          padding: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 8.v,
          ),
          decoration: AppDecoration.fillPrimary.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder14,
          ),
          child: Obx(
            () => Text(
              mainlistItemModelObj.frame!.value,
              style: CustomTextStyles.titleSmallOnErrorContainer,
            ),
          ),
        ),
      ),
    );
  }
}
