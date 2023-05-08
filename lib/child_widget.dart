import 'package:flutter/material.dart';

class ChildWidget extends StatelessWidget {
  final String data;

  const ChildWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(data);
  }
}