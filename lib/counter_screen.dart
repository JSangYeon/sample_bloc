import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_box.dart';
import 'counter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: const Center(
        child: CounterBox(),
      ),
      // body:
      // BlocBuilder<CounterBloc, int>(
      //   builder: (context, count) {
      //     return Center(
      //       child: Text(
      //         '$count',
      //         style: Theme.of(context).textTheme.headlineMedium,
      //       ),
      //     );
      //   },
      // ),
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     FloatingActionButton(
      //       onPressed: () => counterBloc.incrementCounter(),
      //       tooltip: 'Increment',
      //       child: const Icon(Icons.add),
      //     ),
      //     SizedBox(width: 10),
      //     FloatingActionButton(
      //       onPressed: () => counterBloc.decrementCounter(),
      //       tooltip: 'Decrement',
      //       child: const Icon(Icons.remove),
      //     ),
      //   ],
      // ),
    );
  }
}