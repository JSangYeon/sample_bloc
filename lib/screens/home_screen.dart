import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sampleinit/screens/row_flutter_logo_screen.dart';
import 'package:sampleinit/widgets/row_flutter_logo_widget.dart';

import '../blocs/row_flutter_logo_bloc.dart';
import '../color_text_view.dart';
import '../models/row_flutter_logo_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late String secondScreen;
  late String name;
  late RowFlutterLogoBloc _bloc;

  @override
  void initState() {
    super.initState();
    secondScreen = 'SampleWidgetScreen'.tr();
    name = 'chandongi'.tr();


    RowFlutterLogoModel model = RowFlutterLogoModel(
      strFirstLogoColor: 'yellow',
      strSecondLogoColor: 'sky-blue',
      strThirdLogoColor: 'yellow',
    );
    _bloc = RowFlutterLogoBloc(model : model);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
// hello 라는 키를 이용해 언어에 맞는 문자열로 변환
          title: Text('languageChoiceScreen').tr(),
        ),
        body: Column(children: <Widget>[
          // 내일 해당 Row 커스텀뷰로 빼서 정리해 볼 것
          FutureBuilder(
            future: _bloc.fetchColors(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return RowFlutterLogoWidget(
                  colors: snapshot.data as List<Color?>,
                );
              } else if (snapshot.hasError) { // 에러
                return Center(
                  child: Text("Error: ${snapshot.error}"),
                );
              } else { // await 프로그래스 바
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),

          Align(
              alignment: Alignment.centerLeft, // column 안에서 해당 view 왼쪽정렬
              child: ElevatedButton(
                child: Text('Go to $secondScreen'),
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
              )),
          Align(
            alignment: Alignment.centerLeft, // column 안에서 해당 view 왼쪽정렬
            child: ColoredTextView(text: tr('name'), colorName: 'green'),
          ),
          Row(
            children: [
              // 언어 설정
              OutlinedButton.icon(
                onPressed: () {
                  // 한국어로 언어 변경
                  // 이후 앱을 재시작하면 한국어로 동작
                  EasyLocalization.of(context)!.setLocale(Locale('ko', 'KR'));
                },
                icon: Icon(Icons.language_outlined),
                label: Text(
                  'korean'.tr(),
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  // 영어로 언어 변경
                  // 이후 앱을 재시작하면 영어로 동작
                  EasyLocalization.of(context)!.setLocale(Locale('en', 'US'));
                },
                icon: Icon(Icons.language_outlined),
                label: Text(
                  'english'.tr(),
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  // 설정한 언어 삭제
                  // 이후 앱을 재시작하면 OS에 적용된 언어로 시작
                  EasyLocalization.of(context)!.deleteSaveLocale();
                },
                icon: Icon(Icons.language_outlined),
                label: Text(
                  'clear'.tr(),
                ),
              )
            ],
          )
        ])

        // Column(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //
        //   children: <Widget>[
        //     ElevatedButton(
        //       child: Text('Go to $secondScreen'),
        //       onPressed: () {
        //         Navigator.pushNamed(context, '/second');
        //       },
        //     ),
        //     // name이라는 키를 이용해 언어에 맞는 문자열로 변환
        //     Text(tr('name')),
        //     ColoredTextView(text: tr('name'), colorName: 'green'),
        //     // args를 이용해 변환되는 문자열에 변수 추가
        //     Text('myNameIs'.tr(args: [name])),
        //     // namedArgs 를 이용해 변수에 이름 지정
        //     Text('namedArgs'.tr(namedArgs: {'name': name})),
        //     // args + namedArgs 테스트
        //     Text('argsWithNamedArgs'.tr(
        //         args: [name, '${name}2'], namedArgs: {'name': 'named $name'})),
        //     // gender 기능 테스트
        //     // Text('mode'.tr(gender: 'mode1', args: [name])),
        //     // Text('mode'.tr(gender: 'mode2', args: [name])),
        //     // Text('mode'.tr(gender: 'mode3', args: [name])),
        //     // 언어 설정
        //     OutlinedButton.icon(
        //       onPressed: () {
        //         // 한국어로 언어 변경
        //         // 이후 앱을 재시작하면 한국어로 동작
        //         EasyLocalization.of(context)!.setLocale(Locale('ko', 'KR'));
        //       },
        //       icon: Icon(Icons.language_outlined),
        //       label: Text(
        //         'korean'.tr(),
        //       ),
        //     ),
        //     OutlinedButton.icon(
        //       onPressed: () {
        //         // 영어로 언어 변경
        //         // 이후 앱을 재시작하면 영어로 동작
        //         EasyLocalization.of(context)!.setLocale(Locale('en', 'US'));
        //       },
        //       icon: Icon(Icons.language_outlined),
        //       label: Text(
        //         'english'.tr(),
        //       ),
        //     ),
        //     OutlinedButton.icon(
        //       onPressed: () {
        //         // 설정한 언어 삭제
        //         // 이후 앱을 재시작하면 OS에 적용된 언어로 시작
        //         EasyLocalization.of(context)!.deleteSaveLocale();
        //       },
        //       icon: Icon(Icons.language_outlined),
        //       label: Text(
        //         'clear'.tr(),
        //       ),
        //     )
        //   ],
        // ),
        );
  }
}
