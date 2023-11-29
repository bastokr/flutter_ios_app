import '../controller/main_controller.dart';
import '../models/maingrid_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kwon_s_application9/core/app_export.dart';
import 'package:kwon_s_application9/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class MaingridItemWidget extends StatelessWidget {
  MaingridItemWidget(
    this.maingridItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  MaingridItemModel maingridItemModelObj;

  var controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.h),
      decoration: AppDecoration.fillOnErrorContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder14,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 132.v,
            width: 141.h,
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Obx(
                  () => CustomImageView(
                    imagePath: maingridItemModelObj.image!.value,
                    height: 132.v,
                    width: 141.h,
                    radius: BorderRadius.circular(
                      16.h,
                    ),
                    alignment: Alignment.center,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10.h, 8.v, 86.h, 106.v),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusStyle.roundedBorder10,
                    ),
                    child: Row(
                      children: [
                        Obx(
                          () => CustomImageView(
                            imagePath: maingridItemModelObj.image1!.value,
                            height: 14.adaptSize,
                            width: 14.adaptSize,
                            margin: EdgeInsets.only(top: 2.v),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Obx(
                            () => Text(
                              maingridItemModelObj.fortyEight!.value,
                              style: theme.textTheme.labelLarge,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 6.v),
          Padding(
            padding: EdgeInsets.only(left: 7.h),
            child: Obx(
              () => Text(
                maingridItemModelObj.cappucino!.value,
                style: theme.textTheme.titleMedium,
              ),
            ),
          ),
          SizedBox(height: 2.v),
          Padding(
            padding: EdgeInsets.only(left: 7.h),
            child: Obx(
              () => Text(
                maingridItemModelObj.withChocolate!.value,
                style: theme.textTheme.bodySmall,
              ),
            ),
          ),
          SizedBox(height: 13.v),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 1.v,
                    bottom: 7.v,
                  ),
                  child: Obx(
                    () => Text(
                      maingridItemModelObj.price!.value,
                      style: CustomTextStyles.titleMediumErrorContainer,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 34.h),
                  child: CustomIconButton(
                    height: 32.adaptSize,
                    width: 32.adaptSize,
                    padding: EdgeInsets.all(8.h),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgFrame17,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 7.v),
        ],
      ),
    );
  }
}
