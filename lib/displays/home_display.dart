import 'package:flutter/material.dart';
import 'dart:async';

class HomeDisplay extends StatefulWidget {
  const HomeDisplay({super.key});

  @override
  State<HomeDisplay> createState() => _HomeDisplayState();
}

class _HomeDisplayState extends State<HomeDisplay> {
  static List<int> wholeMinutes = [15, 20, 25, 30, 35];
  static int pick = wholeMinutes[0];
  int wholeSeconds = 60 * pick;
  bool isPlaying = false;
  bool isFinished = false;
  bool isResting = false;
  late Timer timer;
  int cycle = 0;
  int round = 0;
  int goal = 12;

  void onSeconds(Timer timer) {
    if (wholeSeconds == 0) {
      if (isResting == false) {
        setState(() {
          isResting = true;
          cycle = cycle + 1;
          if (cycle == 4) {
            cycle = 0;
            round = round + 1;
          }
          if (round == goal) {
            isFinished = true;
          }
          wholeSeconds = 60 * 5;
        });
      } else {
        setState(() {
          isResting = false;
          wholeSeconds = 60 * pick;
        });
      }
    } else {
      setState(() {
        wholeSeconds = wholeSeconds - 1;
      });
    }
  }

  void onPlayPressed() {
    timer = Timer.periodic(Duration(seconds: 1), onSeconds);
    setState(() {
      isPlaying = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isPlaying = false;
    });
  }

  void onResetPressed() {
    timer.cancel();
    setState(() {
      isPlaying = false;
      isFinished = false;
      cycle = 0;
      round = 0;
      goal = 12;
      wholeSeconds = 60 * pick;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    if (isResting == false) {
      return duration.toString().split(".").first.substring(2, 7);
    } else {
      return '휴식중\n${duration.toString().split(".").first.substring(2, 7)}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  format(wholeSeconds),
                  style: isResting
                      ? TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).cardColor,
                        )
                      : TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).cardColor,
                        ),
                ),
              )),
          Flexible(
              flex: 1,
              child: Container(
                  alignment: Alignment.bottomCenter,
                  child: IconButton(
                    onPressed: isPlaying ? onPausePressed : onPlayPressed,
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                    icon: Icon(isPlaying ? Icons.pause : Icons.directions_bike),
                  ))),
          Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Choose Minutes',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).cardColor,
                          ),
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  pick = wholeMinutes[0];
                                  wholeSeconds = 60 * pick;
                                });
                              },
                              child: Text(
                                '15',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).cardColor,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  pick = wholeMinutes[1];
                                  wholeSeconds = 60 * pick;
                                });
                              },
                              child: Text(
                                '20',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).cardColor,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  pick = wholeMinutes[2];
                                  wholeSeconds = 60 * pick;
                                });
                              },
                              child: Text(
                                '25',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).cardColor,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  pick = wholeMinutes[3];
                                  wholeSeconds = 60 * pick;
                                });
                              },
                              child: Text(
                                '30',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).cardColor,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  pick = wholeMinutes[4];
                                  wholeSeconds = 60 * pick;
                                });
                              },
                              child: Text(
                                '35',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).cardColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )),
          Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Cycle',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).cardColor,
                              ),
                            ),
                            Text(
                              '$cycle',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).cardColor,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Round',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).cardColor,
                              ),
                            ),
                            Text(
                              '$round',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).cardColor,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Goal',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).cardColor,
                              ),
                            ),
                            Text(
                              isFinished ? 'Finished' : '$round/12',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).cardColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                        alignment: Alignment.bottomCenter,
                        child: IconButton(
                          onPressed: onResetPressed,
                          iconSize: 40,
                          color: Theme.of(context).cardColor,
                          icon: Icon(Icons.replay),
                        )),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
