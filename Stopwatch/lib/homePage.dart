import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final stopwatch = Stopwatch();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF766FD2),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Stopwatch',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),
            ),
            Stack(
              children: [
                Center(
                  child: Transform.scale(
                    scale: 6,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      backgroundColor: Colors.white70,
                      value: stopwatch.isRunning? null : 0,
                      strokeWidth: 1,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    '${stopwatch.elapsedMilliseconds}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {

                  },
                  tooltip: 'Buzz',
                  icon: const Icon(
                    CupertinoIcons.bell,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      stopwatch.isRunning ? stopwatch.stop() : stopwatch.start();
                    });
                  },
                  tooltip: 'Play / Pause',
                  shape: const CircleBorder(),
                  child: Icon(
                    stopwatch.isRunning? CupertinoIcons.pause_solid : CupertinoIcons.play_arrow_solid,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      stopwatch.stop();
                      stopwatch.reset();
                    });
                  },
                  tooltip: 'reset',
                  icon: const Icon(
                    CupertinoIcons.repeat,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
