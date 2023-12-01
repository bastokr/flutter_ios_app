import 'package:flutter/material.dart';
import 'package:isoflutterapp/core/app_export.dart';

class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({
    Key? key,
    this.onChanged,
  }) : super(
          key: key,
        );

  RxInt selectedIndex = 0.obs;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgIconlyBulkHome,
      activeIcon: ImageConstant.imgIconlyBulkHome,
      type: BottomBarEnum.Iconlybulkhome,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgIconlyBulkHeart,
      activeIcon: ImageConstant.imgIconlyBulkHeart,
      type: BottomBarEnum.Iconlybulkheart,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgIconlyBulkBag,
      activeIcon: ImageConstant.imgIconlyBulkBag,
      type: BottomBarEnum.Iconlybulkbag,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgIconlyBulkNotification,
      activeIcon: ImageConstant.imgIconlyBulkNotification,
      type: BottomBarEnum.Iconlybulknotification,
    )
  ];

  Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 94.v,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.h),
        ),
        border: Border.all(
          color: appTheme.blueGray50,
          width: 1.h,
        ),
      ),
      child: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          elevation: 0,
          currentIndex: selectedIndex.value,
          type: BottomNavigationBarType.fixed,
          items: List.generate(bottomMenuList.length, (index) {
            return BottomNavigationBarItem(
              icon: CustomImageView(
                imagePath: bottomMenuList[index].icon,
                height: 22.v,
                width: 24.h,
                color: appTheme.blueGray400,
              ),
              activeIcon: CustomImageView(
                imagePath: bottomMenuList[index].activeIcon,
                height: 22.v,
                width: 24.h,
                color: theme.colorScheme.primary,
              ),
              label: '',
            );
          }),
          onTap: (index) {
            selectedIndex.value = index;
            onChanged?.call(bottomMenuList[index].type);
          },
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  Iconlybulkhome,
  Iconlybulkheart,
  Iconlybulkbag,
  Iconlybulknotification,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
  });

  String icon;

  String activeIcon;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
