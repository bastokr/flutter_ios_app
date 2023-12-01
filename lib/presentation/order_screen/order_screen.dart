import 'controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:isoflutterapp/core/app_export.dart';
import 'package:isoflutterapp/widgets/app_bar/appbar_leading_image.dart';
import 'package:isoflutterapp/widgets/app_bar/appbar_title.dart';
import 'package:isoflutterapp/widgets/app_bar/custom_app_bar.dart';
import 'package:isoflutterapp/widgets/custom_elevated_button.dart';
import 'package:isoflutterapp/widgets/custom_icon_button.dart';
import 'package:isoflutterapp/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class OrderScreen extends GetWidget<OrderController> {
  const OrderScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 12.v),
              _buildFrameTwentySeven(),
              SizedBox(height: 31.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 25.h),
                  child: Text(
                    "msg_delivery_address".tr,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
              ),
              SizedBox(height: 14.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 25.h),
                  child: Text(
                    "lbl_jl_kpg_sutoyo".tr,
                    style: CustomTextStyles.titleSmallBluegray90003,
                  ),
                ),
              ),
              SizedBox(height: 13.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 25.h),
                  child: Text(
                    "msg_kpg_sutoyo_no".tr,
                    style: CustomTextStyles.bodySmallOnError_1,
                  ),
                ),
              ),
              SizedBox(height: 10.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 25.h),
                  child: Row(
                    children: [
                      _buildEditAddressButton(),
                      _buildAddNoteButton(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.v),
              Divider(
                indent: 30.h,
                endIndent: 30.h,
              ),
              SizedBox(height: 31.v),
              _buildCoffeeRow(),
              SizedBox(height: 21.v),
              Divider(
                color: appTheme.gray10001,
              ),
              SizedBox(height: 14.v),
              _buildDiscountRow(),
              SizedBox(height: 21.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 25.h),
                  child: Text(
                    "lbl_payment_summary".tr,
                    style: CustomTextStyles.titleMediumBluegray900,
                  ),
                ),
              ),
              SizedBox(height: 7.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 25.h,
                  right: 34.h,
                ),
                child: _buildTotalPayment(
                  totalPayment: "lbl_price".tr,
                  price: "lbl_4_53".tr,
                ),
              ),
              SizedBox(height: 14.v),
              _buildDeliveryFeeRow(),
              SizedBox(height: 19.v),
              Divider(
                indent: 25.h,
                endIndent: 34.h,
              ),
              SizedBox(height: 13.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 25.h,
                  right: 34.h,
                ),
                child: _buildTotalPayment(
                  totalPayment: "lbl_total_payment".tr,
                  price: "lbl_5_53".tr,
                ),
              ),
              SizedBox(height: 8.v),
              _buildFrame(),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 57.v,
      leadingWidth: 45.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgIconlyLightArrow,
        margin: EdgeInsets.only(
          left: 21.h,
          top: 13.v,
          bottom: 18.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_order".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildDeliverButton() {
    return CustomElevatedButton(
      height: 40.v,
      width: 154.h,
      text: "lbl_deliver".tr,
      buttonStyle: CustomButtonStyles.fillPrimaryTL10,
    );
  }

  /// Section Widget
  Widget _buildFrameTwentySeven() {
    return Container(
      margin: EdgeInsets.only(
        left: 25.h,
        right: 29.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 5.h,
        vertical: 4.v,
      ),
      decoration: AppDecoration.fillGray200.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder14,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildDeliverButton(),
          Padding(
            padding: EdgeInsets.only(
              top: 10.v,
              right: 47.h,
              bottom: 8.v,
            ),
            child: Text(
              "lbl_pick_up".tr,
              style: theme.textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildEditAddressButton() {
    return CustomOutlinedButton(
      width: 120.h,
      text: "lbl_edit_address".tr,
      leftIcon: Container(
        margin: EdgeInsets.only(right: 4.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgIconEdit,
          height: 14.adaptSize,
          width: 14.adaptSize,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAddNoteButton() {
    return CustomOutlinedButton(
      width: 101.h,
      text: "lbl_add_note".tr,
      margin: EdgeInsets.only(left: 8.h),
      leftIcon: Container(
        margin: EdgeInsets.only(right: 4.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgIconNote,
          height: 14.adaptSize,
          width: 14.adaptSize,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildCoffeeRow() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(
          left: 29.h,
          right: 45.h,
        ),
        child: Row(
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgRectangle170653x54,
              height: 53.v,
              width: 54.h,
              radius: BorderRadius.circular(
                12.h,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 21.h,
                top: 6.v,
                bottom: 6.v,
              ),
              child: Column(
                children: [
                  Text(
                    "lbl_cappucino".tr,
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(height: 2.v),
                  Text(
                    "lbl_with_chocolate".tr,
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(
                top: 12.v,
                bottom: 11.v,
              ),
              child: CustomIconButton(
                height: 30.adaptSize,
                width: 30.adaptSize,
                padding: EdgeInsets.all(6.h),
                decoration: IconButtonStyleHelper.outlineGrayTL15,
                child: CustomImageView(
                  imagePath: ImageConstant.imgFrame33,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 11.h,
                top: 17.v,
                bottom: 16.v,
              ),
              child: Text(
                "lbl_1".tr,
                style: CustomTextStyles.titleSmallBluegray90002,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 12.h,
                top: 12.v,
                bottom: 11.v,
              ),
              child: CustomIconButton(
                height: 30.adaptSize,
                width: 30.adaptSize,
                padding: EdgeInsets.all(6.h),
                decoration: IconButtonStyleHelper.outlineGrayTL15,
                child: CustomImageView(
                  imagePath: ImageConstant.imgFrame32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildDiscountButton() {
    return CustomElevatedButton(
      height: 24.v,
      width: 184.h,
      text: "msg_1_discount_is_applied".tr,
      leftIcon: Container(
        margin: EdgeInsets.only(right: 12.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgIconlyBoldDiscount,
          height: 24.adaptSize,
          width: 24.adaptSize,
        ),
      ),
      buttonStyle: CustomButtonStyles.fillOnErrorContainer,
      buttonTextStyle: theme.textTheme.titleSmall!,
    );
  }

  /// Section Widget
  Widget _buildDiscountRow() {
    return Container(
      margin: EdgeInsets.only(
        left: 24.h,
        right: 34.h,
      ),
      padding: EdgeInsets.all(15.h),
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder14,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildDiscountButton(),
          CustomImageView(
            imagePath: ImageConstant.imgIconlyLightArrowBlueGray90002,
            height: 20.adaptSize,
            width: 20.adaptSize,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDeliveryFeeRow() {
    return Padding(
      padding: EdgeInsets.only(
        left: 25.h,
        right: 34.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "lbl_delivery_fee".tr,
            style: theme.textTheme.bodyMedium,
          ),
          Spacer(),
          Text(
            "lbl_2_0".tr,
            style: theme.textTheme.bodyMedium!.copyWith(
              decoration: TextDecoration.lineThrough,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.h),
            child: Text(
              "lbl_1_0".tr,
              style: theme.textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCashButton() {
    return CustomElevatedButton(
      height: 24.v,
      width: 51.h,
      text: "lbl_cash".tr,
      buttonStyle: CustomButtonStyles.fillPrimaryTL10,
      buttonTextStyle: CustomTextStyles.bodySmallOnErrorContainer_1,
    );
  }

  /// Section Widget
  Widget _buildOrderButton() {
    return CustomElevatedButton(
      text: "lbl_order".tr,
      buttonStyle: CustomButtonStyles.fillPrimary,
    );
  }

  /// Section Widget
  Widget _buildFrame() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 29.h,
        vertical: 14.v,
      ),
      decoration: AppDecoration.outlineBluegray50.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 6.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgVuesaxLinearMoneys,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                ),
                Container(
                  width: 112.h,
                  margin: EdgeInsets.only(left: 22.h),
                  decoration: AppDecoration.fillGray10002.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder14,
                  ),
                  child: Row(
                    children: [
                      _buildCashButton(),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.h,
                          top: 3.v,
                          bottom: 4.v,
                        ),
                        child: Text(
                          "lbl_5_53".tr,
                          style: CustomTextStyles.bodySmallBluegray90002,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                CustomImageView(
                  imagePath: ImageConstant.imgIconDots,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                ),
              ],
            ),
          ),
          SizedBox(height: 16.v),
          _buildOrderButton(),
          SizedBox(height: 14.v),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildTotalPayment({
    required String totalPayment,
    required String price,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 1.v),
          child: Text(
            totalPayment,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: appTheme.blueGray900,
            ),
          ),
        ),
        Text(
          price,
          style: theme.textTheme.titleSmall!.copyWith(
            color: appTheme.blueGray900,
          ),
        ),
      ],
    );
  }
}
