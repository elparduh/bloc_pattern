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
        _counter--;
        break;
      case CounterEvents.increment:
        _counter++;
        break;
    }
    _controller.add(_counter);
  }

  void dispose() {
    _controller.close();
  }
}
