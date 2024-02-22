import 'package:bloc_pattern/pages/counter/counter_bloc.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final _bloc = CounterBloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<int>(
            stream: _bloc.stream,
            initialData: _bloc.counter,
            builder: (_, snapshot) => Text(
                  '${_bloc.counter}',
                  style: const TextStyle(fontSize: 25),
                )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
