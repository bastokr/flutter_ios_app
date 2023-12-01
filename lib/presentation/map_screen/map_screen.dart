import 'controller/map_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:isoflutterapp/core/app_export.dart';
import 'package:isoflutterapp/widgets/custom_icon_button.dart';
import 'package:isoflutterapp/widgets/custom_pin_code_text_field.dart';

// ignore_for_file: must_be_immutable
class MapScreen extends GetWidget<MapController> {
  const MapScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: theme.colorScheme.onErrorContainer,
        body: SizedBox(
          height: 768.v,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: 651.v,
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgMaps,
                        height: 651.v,
                        width: 375.h,
                        alignment: Alignment.center,
                      ),
                      _buildSearchBar(),
                    ],
                  ),
                ),
              ),
              _buildDeliveryDetails(),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSearchBar() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(
          left: 17.h,
          top: 17.v,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 312.v,
              width: 269.h,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 14.h),
                    child: CustomIconButton(
                      height: 44.adaptSize,
                      width: 44.adaptSize,
                      padding: EdgeInsets.all(10.h),
                      decoration: IconButtonStyleHelper.outlineGrayF,
                      alignment: Alignment.topLeft,
                      child: CustomImageView(
                        imagePath: ImageConstant.imgFrame3191,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 290.v,
                      width: 238.h,
                      padding: EdgeInsets.symmetric(horizontal: 48.h),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: fs.Svg(
                            ImageConstant.imgGroup7,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgVector3,
                        height: 6.v,
                        width: 38.h,
                        alignment: Alignment.topRight,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 21.v),
                    child: CustomIconButton(
                      height: 36.adaptSize,
                      width: 36.adaptSize,
                      padding: EdgeInsets.all(8.h),
                      decoration: IconButtonStyleHelper.outlineGrayFTL18,
                      alignment: Alignment.bottomLeft,
                      child: CustomImageView(
                        imagePath: ImageConstant.imgIconBike,
                      ),
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgIconPin,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(
                      top: 10.v,
                      right: 36.h,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 16.h,
                bottom: 268.v,
              ),
              child: CustomIconButton(
                height: 44.adaptSize,
                width: 44.adaptSize,
                padding: EdgeInsets.all(10.h),
                decoration: IconButtonStyleHelper.outlineGrayF,
                child: CustomImageView(
                  imagePath: ImageConstant.imgSearch,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildDeliveryDetails() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(
          left: 30.h,
          right: 30.h,
          bottom: 5.v,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 5.v,
              width: 44.h,
              decoration: BoxDecoration(
                color: appTheme.gray20001,
                borderRadius: BorderRadius.circular(
                  2.h,
                ),
              ),
            ),
            SizedBox(height: 10.v),
            Text(
              "lbl_10_minutes_left".tr,
              style: CustomTextStyles.titleMediumBluegray90003,
            ),
            SizedBox(height: 7.v),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "lbl_delivery_to".tr,
                    style: CustomTextStyles.bodySmallOnError,
                  ),
                  TextSpan(
                    text: "lbl_jl_kpg_sutoyo".tr,
                    style: CustomTextStyles.labelLargeBluegray90003,
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 13.v),
            Obx(
              () => CustomPinCodeTextField(
                context: Get.context!,
                controller: controller.otpController.value,
                onChanged: (value) {},
              ),
            ),
            SizedBox(height: 14.v),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.h,
                vertical: 2.v,
              ),
              decoration: AppDecoration.outlineGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder14,
              ),
              child: Row(
                children: [
                  CustomIconButton(
                    height: 58.adaptSize,
                    width: 58.adaptSize,
                    padding: EdgeInsets.all(13.h),
                    decoration: IconButtonStyleHelper.fillOnErrorContainer,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgIconBikePrimary,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "msg_delivered_your_order".tr,
                          style: CustomTextStyles.labelLargeBluegray90003_1,
                        ),
                        SizedBox(height: 4.v),
                        SizedBox(
                          width: 190.h,
                          child: Text(
                            "msg_we_deliver_your".tr,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.bodySmallOnError_1.copyWith(
                              height: 1.54,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.v),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgGroup3147,
                  height: 48.adaptSize,
                  width: 48.adaptSize,
                  margin: EdgeInsets.only(bottom: 6.v),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 12.h,
                    top: 3.v,
                    bottom: 8.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "lbl_johan_hawn".tr,
                        style: CustomTextStyles.titleSmallBluegray90003,
                      ),
                      SizedBox(height: 7.v),
                      Text(
                        "msg_personal_courier".tr,
                        style: CustomTextStyles.bodySmallOnError_1,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                CustomIconButton(
                  height: 54.adaptSize,
                  width: 54.adaptSize,
                  padding: EdgeInsets.all(15.h),
                  decoration: IconButtonStyleHelper.outlineGray,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgGroup3157,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
