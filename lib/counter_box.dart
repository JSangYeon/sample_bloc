import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';

class CounterBox extends StatefulWidget {
  const CounterBox({Key? key}) : super(key: key);

  @override
  CounterBoxState createState() => CounterBoxState();
}

class CounterBoxState extends State<CounterBox> {
  late CounterBloc _counterBloc;

  @override
  void initState() {
    super.initState();
    _counterBloc = BlocProvider.of<CounterBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[400]!,
          width: 1.0,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, int>(
            builder: (context, count) {
              return Text(
                '$count',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () => _counterBloc.incrementCounter(),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              const SizedBox(width: 10),
              FloatingActionButton(
                onPressed: () => _counterBloc.decrementCounter(),
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
