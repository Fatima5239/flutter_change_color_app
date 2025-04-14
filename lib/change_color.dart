import 'package:flutter/material.dart';
import 'dart:math';

class ChangeColor extends StatefulWidget {
  const ChangeColor({super.key});

  @override
  State<ChangeColor> createState() => _ChangeColorState();
}

class _ChangeColorState extends State<ChangeColor> {
  int currentDirectionIndex = 0;
  Map<String, List<Alignment>> gradientDirections = {
    "Vertical": [Alignment.topCenter, Alignment.bottomCenter],
    "Horizontal": [Alignment.centerLeft, Alignment.centerRight],
    "Left-Right": [Alignment.topLeft, Alignment.bottomRight],
    "Right-Left": [Alignment.topRight, Alignment.bottomLeft],
  };

  late List<Color> gradientColors;
  int red = 33;
  int green = 5;
  int blue = 5;
  final Random random = Random();

  @override
  void initState() {
    super.initState();
    gradientColors = [
      Color.fromARGB(255, red, 5, 109),
      Color.fromARGB(100, green, 5, 109),
      Color.fromARGB(255, blue, 5, 109),
    ];
  }

  List<Color> generateRandomColors() {
    final Random random = Random();
    red = random.nextInt(256);
    green = random.nextInt(256);
    blue = random.nextInt(256);
    return [
      Color.fromARGB(255, red, green, blue),
      Color.fromARGB(100, red, green, blue),
      Color.fromARGB(255, red, green, blue),
    ];
  }

  @override
  Widget build(BuildContext context) {
    String selectedDirection =
        gradientDirections.keys.toList()[currentDirectionIndex];

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: gradientDirections[selectedDirection]![0],
          end: gradientDirections[selectedDirection]![1],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  gradientColors = generateRandomColors();
                });
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                side: BorderSide(color: Colors.white),
                elevation: 0,
              ),
              child: Text(
                'Change Color',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Red: $red Green: $green Blue: $blue',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(height: 30),

          //change direction
          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  if (currentDirectionIndex == gradientDirections.length - 1) {
                    currentDirectionIndex = 0;
                  } else {
                    currentDirectionIndex++;
                  }
                });
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                side: BorderSide(color: Colors.white),
                elevation: 0,
              ),
              child: Text(
                'Change Direction',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Direction: $selectedDirection',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
