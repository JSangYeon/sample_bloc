import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class CounterBloc implements StateStreamableSource<int> {

  /*
    BehavoirSubject는 구독하기 시작하면,
    소스 Stream이 가장 최근에 발행한 항목(또는 아직 아무 값도 발행되지 않았다면 맨 처음 값이나 기본 값)의 발행을 시작하며
    그 이후 소스 Stream에 의해 발행된 항목들을 계속 발행합니다
   */
  final BehaviorSubject<int> _counterController =
      BehaviorSubject<int>.seeded(0);

  void incrementCounter() {
    _counterController.add(_counterController.value + 1);
  }

  void decrementCounter() {
    _counterController.add(_counterController.value - 1);
  }

  void dispose() {
    _counterController.close();
  }

  @override
  FutureOr<void> close() {
    _counterController.close();
  }

  @override
  bool get isClosed => _counterController.isClosed;

  @override
  int get state => 2000;

  @override
  Stream<int> get stream => _counterController.stream; //_counterController observe value
}
