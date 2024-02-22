import 'dart:async';

enum CounterEvents {
  decrement,
  increment,
}

class CounterBloc {
  int _counter = 0;
  int get counter => _counter;

  final _controller = StreamController<int>.broadcast();
  Stream<int> get stream => _controller.stream;

  void add(CounterEvents event) {
    switch (event) {
      case CounterEvents.decrement:
        _emit(_counter - 1);
        break;
      case CounterEvents.increment:
        _emit(_counter + 1);
        break;
    }
  }

  void _emit(int newCounter) {
    if (newCounter != _counter) {
      _counter = newCounter;
      _controller.add(_counter);
    }
  }

  void dispose() {
    _controller.close();
  }
}
