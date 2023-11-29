import 'controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:kwon_s_application9/core/app_export.dart';

// ignore_for_file: must_be_immutable
class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onErrorContainer,
        body: SizedBox(
          height: 768.v,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgImage3,
                height: 504.v,
                width: 375.h,
                alignment: Alignment.topCenter,
              ),
              _buildContinueWithGoogleSection(),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildContinueWithGoogleSection() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 28.h,
          vertical: 44.v,
        ),
        decoration:
            AppDecoration.gradientOnPrimaryContainerToOnPrimaryContainer,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 281.h,
              margin: EdgeInsets.only(
                left: 23.h,
                right: 14.h,
              ),
              child: Text(
                "msg_coffee_so_good".tr,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: theme.textTheme.displaySmall,
              ),
            ),
            SizedBox(height: 24.v),
            Container(
              width: 250.h,
              margin: EdgeInsets.symmetric(horizontal: 34.h),
              child: Text(
                "msg_the_best_grain".tr,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: CustomTextStyles.bodyMediumGray50001.copyWith(
                  height: 1.54,
                ),
              ),
            ),
            SizedBox(height: 18.v),
            Container(
              margin: EdgeInsets.only(right: 2.h),
              padding: EdgeInsets.symmetric(horizontal: 28.h),
              decoration: AppDecoration.outlineOnPrimaryContainer.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.h,
                  vertical: 9.v,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusStyle.roundedBorder10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 33.adaptSize,
                      width: 33.adaptSize,
                      margin: EdgeInsets.only(bottom: 3.v),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 24.adaptSize,
                              width: 24.adaptSize,
                              margin: EdgeInsets.only(bottom: 3.v),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.onErrorContainer,
                              ),
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgLogoGoogleg48dp,
                            height: 33.adaptSize,
                            width: 33.adaptSize,
                            alignment: Alignment.center,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 11.h,
                        top: 6.v,
                        bottom: 5.v,
                      ),
                      child: Text(
                        "msg_continue_with_google".tr,
                        style:
                            CustomTextStyles.titleLargeRobotoOnPrimaryContainer,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
