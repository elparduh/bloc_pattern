import 'dart:async';

class CounterBloc {
  int _counter = 0;
  int get counter => _counter;

  final _controller = StreamController<int>.broadcast();
  Stream<int> get stream => _controller.stream;

  void dispose() {
    _controller.close();
  }
}
