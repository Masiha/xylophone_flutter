import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

// The margin of Xylophone keys
const double stepOfHorizontalMargin = 10.0;
const double fixedVerticalMargin = 2.5;
// Color List, index from 0 to 6
const colorList = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.teal,
  Colors.blue,
  Colors.purple,
];

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  void playSound({int? soundNumber}) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Expanded buildKey({int? noteNumber, Color? color, double? horizontalMargin}) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: fixedVerticalMargin,
          horizontal: horizontalMargin!,
        ),
        child: TextButton(
          child: const Text(''),
          onPressed: () {
            playSound(soundNumber: noteNumber);
          },
          style: TextButton.styleFrom(backgroundColor: color),
        ),
      ),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (int i = 0; i < 7; i++)
                buildKey(
                    noteNumber: i + 1, //noteNumber index 1 to 7
                    color: colorList[i], //colorList index 0 to 6
                    horizontalMargin: i * stepOfHorizontalMargin),
            ],
          ),
        ),
      ),
    );
  }
}
