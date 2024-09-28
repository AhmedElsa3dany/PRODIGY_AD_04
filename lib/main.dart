import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:splashify/splashify.dart';

void main() => runApp(const StopwatchApp());

class StopwatchApp extends StatelessWidget {
  const StopwatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashify(
        imagePath:
            'assests/pngtree-stopwatch-on-measuring-time-accurately-png-image_12344716.png',
        navigateDuration: 8,
        backgroundGradientColor: const LinearGradient(colors: [
          Color(0xff0077b6),
          Color(0xff00b4d8),
        ]),
        slideNavigation: true,
        titleColor: Color(0xff03045e),
        imageFadeIn: true,
        titleBold: true,
        titleFadeIn: true,
        imageSize: 600,
        titleSize: 50,
        child: const StopwatchHome(),
      ),
    );
  }
}

class StopwatchHome extends StatefulWidget {
  const StopwatchHome({super.key});

  @override
  _StopwatchHomeState createState() => _StopwatchHomeState();
}

class _StopwatchHomeState extends State<StopwatchHome> {
  Timer? _timer;
  int _milliseconds = 0;
  bool _isRunning = false;

  void _startStopwatch() {
    if (!_isRunning) {
      _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
        setState(() {
          _milliseconds += 10;
        });
      });
      setState(() {
        _isRunning = true;
      });
    }
  }

  void _pauseStopwatch() {
    if (_isRunning) {
      _timer?.cancel();
      setState(() {
        _isRunning = false;
      });
    }
  }

  void _resetStopwatch() {
    _timer?.cancel();
    setState(() {
      _milliseconds = 0;
      _isRunning = false;
    });
  }

  String _formatTime(int milliseconds) {
    int minutes = (milliseconds ~/ 60000) % 60;
    int seconds = (milliseconds ~/ 1000) % 60;
    int millis = (milliseconds % 1000) ~/ 10;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}:${millis.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.center,
            colors: [
              Color(0xff0077b6),
              Color(0xff00b4d8),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xff4361ee),
                  ),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.center,
                    colors: [
                      Color(0xff0077b6),
                      Color(0xff00b4d8),
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Stop ",
                        style: GoogleFonts.dancingScript(
                          textStyle: const TextStyle(
                              color: Color.fromARGB(255, 255, 251, 251),
                              fontSize: 50,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Icon(
                        FontAwesomeIcons.stopwatch,
                        color: Color(0xfffade8f4),
                        size: 50,
                      ),
                      Text(
                        " Watch",
                        style: GoogleFonts.dancingScript(
                          textStyle: const TextStyle(
                              color: Color.fromARGB(255, 255, 251, 251),
                              fontSize: 50,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Min",
                    style: GoogleFonts.lumanosimo(
                      textStyle: const TextStyle(
                          color: Color(0xff03045e), fontSize: 30),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Text(
                    "Sec",
                    style: GoogleFonts.lumanosimo(
                      textStyle: const TextStyle(
                          color: Color(0xff03045e), fontSize: 30),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Text(
                    "M.Sec",
                    style: GoogleFonts.lumanosimo(
                      textStyle: const TextStyle(
                          color: Color(0xff03045e), fontSize: 30),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xff4361ee),
                  ),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.center,
                    colors: [
                      Color(0xff0077b6),
                      Color(0xff00b4d8),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                child: Text(
                  _formatTime(_milliseconds),
                  style: GoogleFonts.dancingScript(
                    textStyle: const TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: _isRunning ? _pauseStopwatch : _startStopwatch,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(
                        20,
                      ),
                      backgroundColor: _isRunning
                          ? const Color.fromARGB(255, 245, 20, 4)
                          : const Color.fromARGB(255, 3, 245, 11),
                      textStyle: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      _isRunning ? 'Pause' : 'Start',
                      style: GoogleFonts.lumanosimo(
                        textStyle: const TextStyle(
                            color: Color(0xff03045e), fontSize: 30),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: _resetStopwatch,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20),
                      backgroundColor: const Color(0xffcaf0f8),
                      textStyle: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      'Reset',
                      style: GoogleFonts.lumanosimo(
                        textStyle: const TextStyle(
                            color: Color(0xff03045e), fontSize: 30),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
