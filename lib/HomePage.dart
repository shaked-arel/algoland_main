import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import './auth.dart';
import 'config/palette.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Center(
          child: Lottie.asset('assets/loading.json', fit: BoxFit.cover),
        ),
        nextScreen: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        //backgroundColor: Colors.blue,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => AuthGate()));
          },
          tooltip: 'Next Page',
          child: IconTheme(
            data: new IconThemeData(
              color: Colors.blue,
            ),
            child: new Icon(Icons.arrow_forward),
          ),
          backgroundColor: Colors.white,
        ),
        body: Stack(children: <Widget>[
          Center(
              //child: Lottie.asset('assets/logo.json')),
              child: Image.asset('assets/logo_home.png', width: 250)),
          Align(
              alignment: const Alignment(0.1, 0.6),
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Palette.lightBlue2,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText('Algoland'),
                  ],
                  isRepeatingAnimation: false,
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ))
        ]),
      );
}
