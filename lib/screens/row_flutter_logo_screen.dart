// screens/row_flutter_logo_screen.dart

import 'package:flutter/material.dart';
import 'package:sampleinit/blocs/row_flutter_logo_bloc.dart';
import 'package:sampleinit/models/row_flutter_logo_model.dart';
import 'package:sampleinit/widgets/row_flutter_logo_widget.dart';

class RowFlutterLogoScreen extends StatefulWidget {
  final RowFlutterLogoModel model;

  const RowFlutterLogoScreen({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  RowFlutterLogoScreenState createState() => RowFlutterLogoScreenState();
}

class RowFlutterLogoScreenState extends State<RowFlutterLogoScreen> {
  late RowFlutterLogoBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = RowFlutterLogoBloc(model : widget.model);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RowFlutterLogo"),
      ),
      body: FutureBuilder(
        future: _bloc.fetchColors(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return RowFlutterLogoWidget(
              colors: snapshot.data as List<Color?>,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}