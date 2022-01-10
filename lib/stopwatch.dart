import 'dart:async';
import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({Key? key}) : super(key: key);

  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  late int seconds;
  late Timer timer;

  @override
  void initState() {
    super.initState();

    seconds = 0;
    timer = Timer.periodic(const Duration(seconds: 1), _onTick);
  }

  void _onTick(Timer time) {
    setState(() {
      ++seconds;
    });
  }

  @override
  Widget build(BuildContext context) {
    String _secondsText() => seconds == 1 ? 'second' : 'seconds';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stopwatch'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '$seconds ${_secondsText()}',
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty
                  .all<Color>(Colors.green),
                  foregroundColor: MaterialStateProperty
                  .all<Color>(Colors.white),
                ),
                child: const Text('Start'),
                onPressed: null,
              ),
              const SizedBox(width: 20),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty
                  .all<Color>(Colors.red),
                  foregroundColor: MaterialStateProperty
                  .all<Color>(Colors.white),
                ),
                child: const Text('Stop'),
                onPressed: null,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
