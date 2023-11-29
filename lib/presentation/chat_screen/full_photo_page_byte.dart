import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'dart:ui';

import '../../core/utils/pref_utils.dart';

class FullPhotoBytePage extends StatelessWidget {
  final String byte;

  FullPhotoBytePage({Key? key, required this.byte}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppConstants.fullPhotoTitle,
            //  style: TextStyle(color: ColorConstants.primaryColor),
          ),
          centerTitle: true,
        ),
        body: Container(
            child: Image.memory(
          Base64Decoder().convert(byte),
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        )));
  }
}

class AppConstants {
  static const appTitle = "팻퍼블렛";
  static const loginTitle = "로그인";
  static const homeTitle = "채팅중";
  static const settingsTitle = "셋팅";
  static const fullPhotoTitle = "사진보기";
  static const exportADDTitle = "전문가";
}
