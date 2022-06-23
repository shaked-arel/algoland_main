import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        body: Stack(
            children: <Widget>[
              Align(alignment: Alignment.topRight,
                  child: FloatingActionButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Color(0xfbfbfbfb),
                        title: Text("Do you want to log out?"),
                        actions: [
                          Container(
                          width: 300,
                          child: Row(
                            children: <Widget>[
                              Center(
                                child: RaisedButton(
                                  color: Palette.lightgray,
                                  textColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(25.0),
                                  ),
                                  child: Text(
                                    'Log me out',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  onPressed: () {
                                    _signOut();
                                    Navigator.push(context,
                                        new MaterialPageRoute(builder: (context) => AuthGate()));
                                  },
                                ),
                              ),
                              SizedBox(width: 10,),
                              Center(
                                child: RaisedButton(
                                  color: Palette.darkBlue2,
                                  textColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(25.0),
                                  ),
                                  child: Text(
                                    'No, stay logged in!',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          )),
                        ],
                      ));
                    },
                  tooltip: 'Next Page',
                  child: IconTheme(
                  data: new IconThemeData(
                    color: Palette.darkBlue2,
                  ),
                  child: new Icon(Icons.person),
                ),
                backgroundColor: Colors.white,
              )),
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
                        title: Text('About Algoland', textAlign: TextAlign.center, style: GoogleFonts.robotoFlex(color: Colors.orange, fontWeight: FontWeight.bold),),
                        content:
                        Container(
                            width: 280,
                            height: 450,
                            child: Column(
                              children: <Widget>[
                                Text( 'Algoland is a friendly app designed to help you learn algorithms in an experiential way. \r\n'
                                    'You can learn by simulation, quiz and even games. \r\n \r\n'
                                    'Hope you enjoy! \r\n \r\n'
                                    '© Shaked Arel, Itay Carmiel, Noam Sery Levi \r\n', textAlign: TextAlign.center,
                                  style: GoogleFonts.robotoFlex(fontSize: 21),),
                                SizedBox(height: 5,),
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