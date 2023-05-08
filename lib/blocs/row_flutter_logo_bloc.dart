import 'package:flutter/material.dart';
import 'package:sampleinit/models/row_flutter_logo_model.dart';

class RowFlutterLogoBloc {
  final RowFlutterLogoModel model;

  RowFlutterLogoBloc({
    required this.model,
  });

  Future<List<Color?>> fetchColors() async {
    final List<Color> colors = await model.fetchColors();
    return colors;
  }

}
