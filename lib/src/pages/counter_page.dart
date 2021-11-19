import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CounterPageState();
  }
}

class _CounterPageState extends State<CounterPage> {
  final _textStyle = const TextStyle(
    color: Colors.white,
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );

  int _conteo = 0;

  Widget _createButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        const SizedBox(width: 30.0),
        FloatingActionButton(
          backgroundColor: Colors.indigo,
          child: const Icon(
            Icons.exposure_zero,
            size: 30,
          ),
          onPressed: () => _handleCalculate(TypeCalculate.zero),
        ),
        const Expanded(child: SizedBox()),
        FloatingActionButton(
          backgroundColor: Colors.indigo,
          child: const Icon(
            Icons.remove,
            size: 30,
          ),
          onPressed: () => _handleCalculate(TypeCalculate.less),
        ),
        const SizedBox(width: 10.0),
        FloatingActionButton(
          backgroundColor: Colors.indigo,
          child: const Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () => _handleCalculate(TypeCalculate.more),
        ),
      ],
    );
  }

  void _handleCalculate(TypeCalculate type) {
    setState(() {
      switch (type) {
        case TypeCalculate.zero:
          _conteo = 0;
          break;
        case TypeCalculate.less:
          if (_conteo != 0) _conteo--;
          break;
        case TypeCalculate.more:
          _conteo++;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      floatingActionButton: _createButtons(),
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("Mi primer app"),
        centerTitle: true,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Numero de clicks:", style: _textStyle),
              Text('$_conteo', style: _textStyle),
            ],
          ),
        ),
      ),
    );
  }
}

enum TypeCalculate { zero, less, more }
