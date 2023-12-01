import 'package:flutter/material.dart';
import 'package:isoflutterapp/core/app_export.dart';
import 'package:isoflutterapp/widgets/custom_drop_down.dart';

// ignore: must_be_immutable
class AppbarTitleDropdown extends StatelessWidget {
  AppbarTitleDropdown({
    Key? key,
    required this.hintText,
    required this.items,
    required this.onTap,
    this.margin,
  }) : super(
          key: key,
        );

  String? hintText;

  List<SelectionPopupModel> items;

  Function(SelectionPopupModel) onTap;

  EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: CustomDropDown(
        width: 155.h,
        icon: Container(
          margin: EdgeInsets.only(left: 3.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgArrowdown,
            height: 14.adaptSize,
            width: 14.adaptSize,
          ),
        ),
        hintText: "msg_bilzen_tanjungbalai".tr,
        items: items,
        onChanged: (value) {
          onTap(value!);
        },
      ),
    );
  }
}
