import 'dart:async';

import 'package:flutter/material.dart';

part 'event.dart';
part 'state.dart';

class CounterBloc {
  int _counter = 0;

  final _counterStateController = StreamController<CounterState>();
  StreamSink<CounterState> get _inCounterState => _counterStateController.sink;
  Stream<CounterState> get counterState => _counterStateController.stream;

  final _counterEventController = StreamController<CounterEvent>();
  StreamSink<CounterEvent> get counterEventSink => _counterEventController.sink;




  CounterBloc() {
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent) {
      _counter++;
    } else if (event is DecrementEvent) {
      _counter--;
    }
    _inCounterState.add(CounterState(_counter));
  }

  void dispose() {
    _counterStateController.close();
    _counterEventController.close();
  }
}
