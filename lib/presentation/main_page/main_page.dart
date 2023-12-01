import 'package:webview_flutter/webview_flutter.dart';

import '../main_page/widgets/maingrid_item_widget.dart';
import '../main_page/widgets/mainlist_item_widget.dart';
import 'controller/main_controller.dart';
import 'models/main_model.dart';
import 'models/maingrid_item_model.dart';
import 'models/mainlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:isoflutterapp/core/app_export.dart';
import 'package:isoflutterapp/widgets/app_bar/appbar_subtitle.dart';
import 'package:isoflutterapp/widgets/app_bar/appbar_title_dropdown.dart';
import 'package:isoflutterapp/widgets/app_bar/appbar_trailing_image.dart';
import 'package:isoflutterapp/widgets/app_bar/custom_app_bar.dart';
import 'package:isoflutterapp/widgets/custom_elevated_button.dart';
import 'package:isoflutterapp/widgets/custom_search_view.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key})
      : super(
          key: key,
        );

  MainController controller = Get.put(MainController(MainModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillGray,
          child: Column(
            children: [
              _buildFrameEight(),
              Expanded(
                child: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: 25.v),
                      _buildMainList(),
                      SizedBox(height: 24.v),
                      _buildMainGrid(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFrameEight() {
    return SizedBox(
      height: 306.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 18.v),
              decoration: AppDecoration.gradientOnPrimaryToBlueGray,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomAppBar(
                    title: Padding(
                      padding: EdgeInsets.only(left: 30.h),
                      child: Column(
                        children: [
                          AppbarSubtitle(
                            text: "lbl_location".tr,
                            margin: EdgeInsets.only(right: 103.h),
                          ),
                          SizedBox(height: 4.v),
                          Obx(
                            () => AppbarTitleDropdown(
                              hintText: "msg_bilzen_tanjungbalai".tr,
                              items: controller
                                  .mainModelObj.value.dropdownItemList!.value,
                              onTap: (value) {
                                controller.onSelected(value);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      AppbarTrailingImage(
                        imagePath: ImageConstant.imgImage1,
                        margin: EdgeInsets.symmetric(horizontal: 31.h),
                      ),
                    ],
                  ),
                  SizedBox(height: 26.v),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 29.h,
                      right: 31.h,
                    ),
                    child: CustomSearchView(
                      controller: controller.searchController,
                      hintText: "lbl_search_coffee".tr,
                    ),
                  ),
                  SizedBox(height: 68.v),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              margin: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusStyle.roundedBorder14,
              ),
              child: Container(
                height: 140.v,
                width: 315.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusStyle.roundedBorder14,
                ),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgImage81,
                      height: 140.v,
                      width: 315.h,
                      radius: BorderRadius.circular(
                        16.h,
                      ),
                      alignment: Alignment.center,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 23.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomElevatedButton(
                              height: 26.v,
                              width: 60.h,
                              text: "lbl_promo".tr,
                              buttonStyle: CustomButtonStyles.fillRed,
                              buttonTextStyle:
                                  CustomTextStyles.titleSmallOnErrorContainer,
                            ),
                            SizedBox(height: 12.v),
                            SizedBox(
                              height: 80.v,
                              width: 200.h,
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      height: 27.v,
                                      width: 200.h,
                                      margin: EdgeInsets.only(top: 18.v),
                                      decoration: BoxDecoration(
                                        color: theme
                                            .colorScheme.onSecondaryContainer,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Container(
                                      height: 23.v,
                                      width: 149.h,
                                      decoration: BoxDecoration(
                                        color: theme
                                            .colorScheme.onSecondaryContainer,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      width: 192.h,
                                      child: Text(
                                        "msg_buy_one_get_one".tr,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.headlineLarge,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      height: 130,
                                      child: WebViewWidget(
                                          controller:
                                              controller.webcontroller)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildMainList() {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        height: 38.v,
        child: Obx(
          () => ListView.separated(
            padding: EdgeInsets.only(left: 29.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                width: 7.h,
              );
            },
            itemCount:
                controller.mainModelObj.value.mainlistItemList.value.length,
            itemBuilder: (context, index) {
              MainlistItemModel model =
                  controller.mainModelObj.value.mainlistItemList.value[index];
              return MainlistItemWidget(
                model,
              );
            },
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildMainGrid() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: 38.h,
          right: 29.h,
        ),
        child: Obx(
          () => GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 239.v,
              crossAxisCount: 2,
              mainAxisSpacing: 5.h,
              crossAxisSpacing: 5.h,
            ),
            physics: BouncingScrollPhysics(),
            itemCount:
                controller.mainModelObj.value.maingridItemList.value.length,
            itemBuilder: (context, index) {
              MaingridItemModel model =
                  controller.mainModelObj.value.maingridItemList.value[index];
              return MaingridItemWidget(
                model,
              );
            },
          ),
        ),
      ),
    );
  }
}
