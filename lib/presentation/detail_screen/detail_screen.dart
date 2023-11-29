import 'controller/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:kwon_s_application9/core/app_export.dart';
import 'package:kwon_s_application9/widgets/app_bar/appbar_leading_image.dart';
import 'package:kwon_s_application9/widgets/app_bar/appbar_title.dart';
import 'package:kwon_s_application9/widgets/app_bar/appbar_trailing_image.dart';
import 'package:kwon_s_application9/widgets/app_bar/custom_app_bar.dart';
import 'package:kwon_s_application9/widgets/custom_elevated_button.dart';
import 'package:kwon_s_application9/widgets/custom_icon_button.dart';
import 'package:readmore/readmore.dart';

// ignore_for_file: must_be_immutable
class DetailScreen extends GetWidget<DetailController> {
  const DetailScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 29.h,
            vertical: 13.v,
          ),
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgRectangle1706,
                height: 226.v,
                width: 315.h,
                radius: BorderRadius.circular(
                  16.h,
                ),
              ),
              SizedBox(height: 20.v),
              _buildProductRow(),
              SizedBox(height: 25.v),
              Divider(),
              SizedBox(height: 19.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "lbl_description".tr,
                  style: CustomTextStyles.titleMediumBluegray900,
                ),
              ),
              SizedBox(height: 15.v),
              SizedBox(
                width: 305.h,
                child: ReadMoreText(
                  "msg_a_cappuccino_is".tr,
                  trimLines: 3,
                  colorClickableText: theme.colorScheme.primary,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: "lbl_read_more".tr,
                  moreStyle: CustomTextStyles.bodyMediumGray500.copyWith(
                    height: 1.64,
                  ),
                  lessStyle: CustomTextStyles.bodyMediumGray500.copyWith(
                    height: 1.64,
                  ),
                ),
              ),
              SizedBox(height: 17.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "lbl_size".tr,
                  style: CustomTextStyles.titleMediumBluegray900,
                ),
              ),
              SizedBox(height: 12.v),
              _buildSizeRow(),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildBuyNowRow(),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 55.v,
      leadingWidth: 45.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgIconlyLightArrow,
        margin: EdgeInsets.only(
          left: 21.h,
          top: 15.v,
          bottom: 16.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_detail".tr,
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgIconlyLightHeart,
          margin: EdgeInsets.fromLTRB(30.h, 16.v, 30.h, 15.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildProductRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "lbl_cappucino".tr,
              style: theme.textTheme.titleLarge,
            ),
            SizedBox(height: 6.v),
            Text(
              "lbl_with_chocolate".tr,
              style: theme.textTheme.bodySmall,
            ),
            SizedBox(height: 12.v),
            Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgFurniturIconYellow700,
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  margin: EdgeInsets.only(
                    top: 1.v,
                    bottom: 2.v,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 4.h),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "lbl_4_82".tr,
                          style: theme.textTheme.titleMedium,
                        ),
                        TextSpan(
                          text: "lbl_230".tr,
                          style: CustomTextStyles.bodySmallOnError,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ],
        ),
        Spacer(),
        Container(
          height: 44.adaptSize,
          width: 44.adaptSize,
          margin: EdgeInsets.only(
            top: 36.v,
            bottom: 4.v,
          ),
          decoration: AppDecoration.fillGray800.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder14,
          ),
          child: CustomIconButton(
            height: 44.adaptSize,
            width: 44.adaptSize,
            padding: EdgeInsets.all(10.h),
            decoration: IconButtonStyleHelper.fillRed,
            alignment: Alignment.center,
            child: CustomImageView(
              imagePath: ImageConstant.imgIconBean,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 15.h,
            top: 36.v,
            bottom: 4.v,
          ),
          child: CustomIconButton(
            height: 44.adaptSize,
            width: 44.adaptSize,
            padding: EdgeInsets.all(10.h),
            decoration: IconButtonStyleHelper.fillRed,
            child: CustomImageView(
              imagePath: ImageConstant.imgIconMilk,
            ),
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSizeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 96.h,
          padding: EdgeInsets.symmetric(
            horizontal: 30.h,
            vertical: 11.v,
          ),
          decoration: AppDecoration.outlineGray30001.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder14,
          ),
          child: Text(
            "lbl_s".tr,
            style: CustomTextStyles.bodyMediumBluegray90002,
          ),
        ),
        Container(
          width: 96.h,
          padding: EdgeInsets.symmetric(
            horizontal: 30.h,
            vertical: 11.v,
          ),
          decoration: AppDecoration.outlinePrimary.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder14,
          ),
          child: Text(
            "lbl_m".tr,
            style: CustomTextStyles.bodyMediumPrimary,
          ),
        ),
        Container(
          width: 96.h,
          padding: EdgeInsets.symmetric(
            horizontal: 30.h,
            vertical: 11.v,
          ),
          decoration: AppDecoration.outlineGray30001.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder14,
          ),
          child: Text(
            "lbl_l".tr,
            style: CustomTextStyles.bodyMediumBluegray90002,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildBuyNowRow() {
    return Container(
      margin: EdgeInsets.only(
        left: 39.h,
        right: 18.h,
        bottom: 34.v,
      ),
      decoration: AppDecoration.outlineBlueGray.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 1.v,
              bottom: 3.v,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_price".tr,
                  style: CustomTextStyles.bodyMediumGray500,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.v),
                  child: Text(
                    "lbl_4_53".tr,
                    style: CustomTextStyles.titleMediumPrimary,
                  ),
                ),
              ],
            ),
          ),
          CustomElevatedButton(
            width: 217.h,
            text: "lbl_buy_now".tr,
            buttonStyle: CustomButtonStyles.fillPrimary,
          ),
        ],
      ),
    );
  }
}
