import 'package:binarysearch/config/palette.dart';
import 'package:binarysearch/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'BinarySearchGame/level1.dart';
import 'BinarySearchGame/level1/level1b.dart';
import 'BinarySearchGame/level1/level1c.dart';
import 'BinarySearchGame/level1/level1d.dart';
import 'BinarySearchGame/level2/level2.dart';
import 'BinarySearchGame/level2/level2b.dart';
import 'BinarySearchGame/level2/level2c.dart';
import 'auth.dart';

class Todo {
  final String title;
  final String description;

  Todo({required this.title, required this.description});
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Levels passing',
    home: BinaryTodoScreen(
      levels: List.generate(
        7,
        (index) => Todo(
            title: 'Level ${index + 1} ',
            description: "description for level $index"),
      ),
    ),
  ));
}

class BinaryTodoScreen extends StatelessWidget {
  final List<Todo> levels;
  final pass = Color.fromARGB(255, 194, 243, 162);
  final notPass = Color.fromARGB(255, 164, 235, 245);

  BinaryTodoScreen({required this.levels});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.black),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white12,
              elevation: 0,
              title: Text("Levels",
                  style: GoogleFonts.robotoFlex(
                      color: Palette.darkBlue2, fontWeight: FontWeight.bold)),
              centerTitle: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Palette.darkBlue2,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage('assets/levels.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  // This next line does the trick.
                  //scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Align(
                      alignment: Alignment(-0.6, -0.8),
                      child: SizedBox(
                        width: 75.0,
                        height: 75.0,
                        child: FloatingActionButton(
                          heroTag: "1",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LevelScreen(index: 0),
                              ),
                            );
                          },
                          child: IconTheme(
                              data: new IconThemeData(),
                              child: levelBinary >= 1
                                  ? Container(
                                      constraints: BoxConstraints.expand(),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image:
                                              AssetImage('assets/complete.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(top: 17.0),
                                        child: Text('1',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.robotoFlex(
                                              color: Palette.darkBlue2,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                            )),
                                      ))
                                  : Container(
                                      constraints: BoxConstraints.expand(),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/not-complete.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(top: 17.0),
                                        child: Text('1',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.robotoFlex(
                                              color: Palette.darkBlue2,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                            )),
                                      ))),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, -0.8),
                      child: SizedBox(
                        width: 70.0,
                        height: 70.0,
                        child: FloatingActionButton(
                          heroTag: "2",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LevelScreen(index: 1),
                              ),
                            );
                          },
                          child: IconTheme(
                              data: new IconThemeData(),
                              child: levelBinary >= 2
                                  ? Container(
                                      constraints: BoxConstraints.expand(),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image:
                                              AssetImage('assets/complete.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(top: 17.0),
                                        child: Text('2',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.robotoFlex(
                                              color: Palette.darkBlue2,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                            )),
                                      ))
                                  : Container(
                                      constraints: BoxConstraints.expand(),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/not-complete.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(top: 17.0),
                                        child: Text('2',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.robotoFlex(
                                              color: Palette.darkBlue2,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                            )),
                                      ))),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.6, -0.8),
                      child: SizedBox(
                        width: 70.0,
                        height: 70.0,
                        child: FloatingActionButton(
                          heroTag: "3",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LevelScreen(index: 2),
                              ),
                            );
                          },
                          child: IconTheme(
                              data: new IconThemeData(),
                              child: levelBinary >= 3
                                  ? Container(
                                      constraints: BoxConstraints.expand(),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image:
                                              AssetImage('assets/complete.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(top: 17.0),
                                        child: Text('3',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.robotoFlex(
                                              color: Palette.darkBlue2,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                            )),
                                      ))
                                  : Container(
                                      constraints: BoxConstraints.expand(),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/not-complete.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(top: 17.0),
                                        child: Text('3',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.robotoFlex(
                                              color: Palette.darkBlue2,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                            )),
                                      ))),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.6, -0.48),
                      child: SizedBox(
                        width: 70.0,
                        height: 70.0,
                        child: FloatingActionButton(
                          heroTag: "4",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LevelScreen(index: 3),
                              ),
                            );
                          },
                          child: IconTheme(
                              data: new IconThemeData(),
                              child: levelBinary >= 4
                                  ? Container(
                                      constraints: BoxConstraints.expand(),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image:
                                              AssetImage('assets/complete.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(top: 17.0),
                                        child: Text('4',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.robotoFlex(
                                              color: Palette.darkBlue2,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                            )),
                                      ))
                                  : Container(
                                      constraints: BoxConstraints.expand(),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/not-complete.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(top: 17.0),
                                        child: Text('4',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.robotoFlex(
                                              color: Palette.darkBlue2,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                            )),
                                      ))),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, -0.48),
                      child: SizedBox(
                        width: 70.0,
                        height: 70.0,
                        child: FloatingActionButton(
                          heroTag: "5",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LevelScreen(index: 4),
                              ),
                            );
                          },
                          child: IconTheme(
                              data: new IconThemeData(),
                              child: levelBinary >= 5
                                  ? Container(
                                      constraints: BoxConstraints.expand(),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image:
                                              AssetImage('assets/complete.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(top: 17.0),
                                        child: Text('5',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.robotoFlex(
                                              color: Palette.darkBlue2,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                            )),
                                      ))
                                  : Container(
                                      constraints: BoxConstraints.expand(),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/not-complete.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(top: 17.0),
                                        child: Text('5',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.robotoFlex(
                                              color: Palette.darkBlue2,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                            )),
                                      ))),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.6, -0.48),
                      child: SizedBox(
                        width: 70.0,
                        height: 70.0,
                        child: FloatingActionButton(
                          heroTag: "6",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LevelScreen(index: 5),
                              ),
                            );
                          },
                          child: IconTheme(
                              data: new IconThemeData(),
                              child: levelBinary >= 6
                                  ? Container(
                                      constraints: BoxConstraints.expand(),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image:
                                              AssetImage('assets/complete.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(top: 17.0),
                                        child: Text('6',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.robotoFlex(
                                              color: Palette.darkBlue2,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                            )),
                                      ))
                                  : Container(
                                      constraints: BoxConstraints.expand(),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/not-complete.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(top: 17.0),
                                        child: Text('6',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.robotoFlex(
                                              color: Palette.darkBlue2,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                            )),
                                      ))),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.6, -0.16),
                      child: SizedBox(
                        width: 70.0,
                        height: 70.0,
                        child: FloatingActionButton(
                          heroTag: "7",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LevelScreen(index: 6),
                              ),
                            );
                          },
                          child: IconTheme(
                              data: new IconThemeData(),
                              child: levelBinary >= 7
                                  ? Container(
                                      constraints: BoxConstraints.expand(),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image:
                                              AssetImage('assets/complete.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(top: 17.0),
                                        child: Text('7',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.robotoFlex(
                                              color: Palette.darkBlue2,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                            )),
                                      ))
                                  : Container(
                                      constraints: BoxConstraints.expand(),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/not-complete.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(top: 17.0),
                                        child: Text('7',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.robotoFlex(
                                              color: Palette.darkBlue2,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                            )),
                                      ))),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ))));
  }
}
// return Scaffold(
//   appBar: AppBar(
//     backgroundColor: Colors.white12,
//     elevation: 0,
//     title: Text("Levels",
//       style: GoogleFonts.robotoFlex(color: Palette.darkBlue2, fontWeight: FontWeight.bold)),
//     centerTitle: true,
//     leading: IconButton(
//       icon: Icon(Icons.arrow_back_ios),
//       color: Palette.darkBlue2,
//       onPressed: () {
//         Navigator.pop(context);
//       },
//     ),
//   ),
//   body: ListView.builder(
//     itemCount: levels.length,
//     itemBuilder: (context, index) {
//       return ListTile(
//         title: Text(levels[index].title),
//         tileColor: index < levelBinary ? pass : notPass,
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => LevelScreen(index: index),
//             ),
//           );
//         },
//       );
//     },
//   ),
// );
//  }
//}

class LevelScreen extends StatelessWidget {
  final int index;

  LevelScreen({required this.index});

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return Level1Page();
      case 1:
        return Level1bPage();
      case 2:
        return Level1cPage();
      case 3:
        return Level1dPage();
      case 4:
        return Level2Page();
      case 5:
        return Level2bPage();
      case 6:
        return Level2cPage();
      default:
        return Scaffold();
    }
  }
}

// child: IconTheme(
// data: new IconThemeData(
// color: Colors.blue,
// ),
// //child: new Icon(Icons.arrow_forward),
// child: Text('1', style: TextStyle(color: Colors.blue)),
// ),
// backgroundColor: Colors.white,
// ),

class DetailScreen extends StatelessWidget {
  final Todo level;

  DetailScreen({required this.level});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(level.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(level.description),
      ),
    );
  }
}
