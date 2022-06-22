import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:binarysearch/Algorithms.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import './auth.dart';
import 'config/palette.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Center(
          child: Image.asset('assets/Hello.gif', height: 200, ),
        ),
        nextScreen: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        //backgroundColor: Colors.blue,
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Navigator.push(context,
        //         new MaterialPageRoute(builder: (context) => AuthGate()));
        //   },
        //   tooltip: 'Next Page',
        //   child: IconTheme(
        //     data: new IconThemeData(
        //       color: Palette.darkBlue2,
        //     ),
        //     child: new Icon(Icons.arrow_forward),
        //   ),
        //   backgroundColor: Colors.white,
        // ),
        body: Stack(
            children: <Widget>[
              // Align(alignment: Alignment.topRight,
              //     child: FloatingActionButton(
              //   onPressed: () {
              //     _signOut();
              //     Navigator.push(context,
              //         new MaterialPageRoute(builder: (context) => SignInScreen(
              //           providerConfigs: [
              //             EmailProviderConfiguration(),
              //           ],
              //         )));
              //       },
              //     tooltip: 'Next Page',
              //     child: IconTheme(
              //     data: new IconThemeData(
              //       color: Palette.darkBlue2,
              //     ),
              //     child: new Icon(Icons.logout),
              //   ),
              //   backgroundColor: Colors.white,
              // )),
          Center(
              //child: Lottie.asset('assets/logo.json')),
              child: Image.asset('assets/Hello.gif', width: 250)),
          Align(
              alignment: const Alignment(0, 0.32),
              child: Text('Algoland',
                style: GoogleFonts.robotoFlex(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Palette.darkBlue2,
                ),),),
    Align(
      alignment: Alignment(0, 0.65),
      child: Padding(
          padding:  const EdgeInsets.all(0),
          child:  Container(
              width: 180,
              height: 40,
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 2.0, color: Palette.darkBlue2,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),),
                  primary: Colors.white,
                  //primary: _hasBeenPressed ? Colors.grey : Palette.lightBlue2,
                ),
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => AuthGate()));
                },
                child: Text(
                "Get Started",
                style: GoogleFonts.robotoFlex(color: Colors.black, fontSize: 15,),
              ),
              )),
      )),
      Align(
        alignment: Alignment(0, 0.8),
        child: Padding(
          padding:  const EdgeInsets.all(0),
          child:  Container(
              width: 180,
              height: 40,
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 2.0, color: Palette.darkBlue2,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),),
                  primary: Colors.white,
                  //primary: _hasBeenPressed ? Colors.grey : Palette.lightBlue2,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Color(0xfbfbfbfb),
                        title: Text('Algoland', textAlign: TextAlign.center, style: GoogleFonts.robotoFlex(color: Colors.orange, fontWeight: FontWeight.bold),),
                        content:
                        Container(
                            width: 200,
                            height: 320,
                            child: Column(
                              children: <Widget>[
                                Text( 'Algoland is a friendly app designed to help you learn algorithms in an experiential way. \r\n'
                                    'You can learn by simulation, quiz and even games. \r\n'
                                    'Hope you enjoy!', textAlign: TextAlign.center,
                                  style: GoogleFonts.robotoFlex(fontSize: 21),),
                                SizedBox(height: 13,),
                                Align(alignment: Alignment.bottomCenter,
                                  child: Image.asset(
                                      "assets/dialog.png"),),
                              ],
                            )
                        ),
                      ));
                },
                child: Text(
                  "About",
                  style: GoogleFonts.robotoFlex(color: Colors.black, fontSize: 15),
                ),
              )),
        ),
    )],),
      );
}

Future<void> _signOut() async {
  await FirebaseAuth.instance.signOut();
}