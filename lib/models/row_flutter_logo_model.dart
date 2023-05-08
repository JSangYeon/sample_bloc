import 'package:flutter/material.dart';
import 'package:sampleinit/utils/color_util.dart';

class RowFlutterLogoModel {
  final String strFirstLogoColor;
  final String strSecondLogoColor;
  final String strThirdLogoColor;

  RowFlutterLogoModel({
    required this.strFirstLogoColor,
    required this.strSecondLogoColor,
    required this.strThirdLogoColor,
  });

  Future<List<Color>> fetchColors() async {
    final List<Color> colors = await Future.wait([
      ColorUtil.getColor(strFirstLogoColor),
      ColorUtil.getColor(strSecondLogoColor),
      ColorUtil.getColor(strThirdLogoColor),
    ]);
    return colors;
  }
}
