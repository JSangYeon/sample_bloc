import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_bloc/picker_screen.dart';
import 'dart:async';
import 'counter_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
        // appBarTheme: const AppBarTheme(
        //   systemOverlayStyle: SystemUiOverlayStyle.dark,
        // ),
        primarySwatch: Colors.blue,
      ),
      // home: const PickerScreen()
      home: BlocProvider(//Bloc 패턴을 사용하는 하위 컴포넌트 생성할 때, BlocProvider로 생성
        create: (_) => CounterBloc(),
        child: const SafeArea(child: CounterScreen()),
      ),
    );
  }
}
//
// class CounterBloc {
//   int _counter = 0;
//   final _counterController = StreamController<int>();
//
//   Stream<int> get counterStream => _counterController.stream;
//   int get counter => _counter;
//
//   void increment() {
//     _counter++;
//     _counterController.sink.add(_counter);
//   }
//
//   void decrement() {
//     _counter--;
//     _counterController.sink.add(_counter);
//   }
//
//   void dispose() {
//     _counterController.close();
//   }
// }
//
// class CounterScreen extends StatefulWidget {
//   const CounterScreen({super.key});
//
//   @override
//   CounterScreenState createState() => CounterScreenState();
// }
//
//  class CounterScreenState extends State<CounterScreen> {
//   final CounterBloc _bloc = CounterBloc();
//
//   @override
//   void dispose() {
//     _bloc.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Counter')),
//       body: Center(
//         child: StreamBuilder<int>(
//           stream: _bloc.counterStream,
//           initialData: _bloc.counter,
//           builder: (context, snapshot) {
//             return Text(
//               '${snapshot.data}',
//               style: Theme.of(context).textTheme.headlineMedium,
//             );
//           },
//         ),
//       ),
//       bottomNavigationBar: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           FloatingActionButton(
//             onPressed: () => _bloc.increment(),
//             tooltip: 'Increment',
//             child: const Icon(Icons.add),
//           ),
//           FloatingActionButton(
//             onPressed: () => _bloc.decrement(),
//             tooltip: 'Decrement',
//             child: const Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }
// }
