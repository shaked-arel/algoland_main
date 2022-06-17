import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'config/palette.dart';
import 'insertionSortGame/level1/main.dart';
import 'insertionSortGame/level1b/level1e.dart';
import 'insertionSortGame/level2/main.dart';
import 'insertionSortGame/level1b/level1b.dart';
import 'insertionSortGame/level1b/level1c.dart';
import 'insertionSortGame/level1b/level1d.dart';
import 'insertionSortGame/level2b/level2b.dart';
import 'insertionSortGame/level2b/level2c.dart';
import 'insertionSortGame/level2b/level2d.dart';
import 'insertionSortGame/level3/level3b.dart';
import 'insertionSortGame/level3/main.dart';
import 'normalNumber.dart';
import 'global.dart';

class Todo {
  final String title;
  final String description;

  Todo({required this.title, required this.description});
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Levels passing',
    home: TodoScreen(
      levels: List.generate(
        11,
        (index) => Todo(
            title: 'Level ${index + 1} ',
            description: "description for level $index"),
      ),
    ),
  ));
}

class TodoScreen extends StatelessWidget {
  final List<Todo> levels;
  final pass = Color.fromARGB(255, 194, 243, 162);
  final notPass = Color.fromARGB(255, 164, 235, 245);

  TodoScreen({required this.levels});

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
                              child: levelInsertion >= 1
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
                              child: levelInsertion >= 2
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
                              child: levelInsertion >= 3
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
                              child: levelInsertion >= 4
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
                              child: levelInsertion >= 5
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
                              child: levelInsertion >= 6
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
                              child: levelInsertion >= 7
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
                    Align(
                      alignment: Alignment(0, -0.16),
                      child: SizedBox(
                        width: 70.0,
                        height: 70.0,
                        child: FloatingActionButton(
                          heroTag: "8",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LevelScreen(index: 7),
                              ),
                            );
                          },
                          child: IconTheme(
                              data: new IconThemeData(),
                              child: levelInsertion >= 8
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
                                        child: Text('8',
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
                                        child: Text('8',
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
                      alignment: Alignment(0.6, -0.16),
                      child: SizedBox(
                        width: 70.0,
                        height: 70.0,
                        child: FloatingActionButton(
                          heroTag: "9",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LevelScreen(index: 8),
                              ),
                            );
                          },
                          child: IconTheme(
                              data: new IconThemeData(),
                              child: levelInsertion >= 9
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
                                        child: Text('9',
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
                                        child: Text('9',
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
                      alignment: Alignment(-0.6, 0.16),
                      child: SizedBox(
                        width: 70.0,
                        height: 70.0,
                        child: FloatingActionButton(
                          heroTag: "10",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LevelScreen(index: 9),
                              ),
                            );
                          },
                          child: IconTheme(
                              data: new IconThemeData(),
                              child: levelInsertion >= 10
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
                                        child: Text('10',
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
                                        child: Text('10',
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
                      alignment: Alignment(0, 0.16),
                      child: SizedBox(
                        width: 70.0,
                        height: 70.0,
                        child: FloatingActionButton(
                          heroTag: "11",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LevelScreen(index: 10),
                              ),
                            );
                          },
                          child: IconTheme(
                              data: new IconThemeData(),
                              child: levelInsertion >= 11
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
                                        child: Text('11',
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
                                        child: Text('11',
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

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Levels"),
//       ),
//       body: ListView.builder(
//         itemCount: levels.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(levels[index].title),
//             tileColor: index < levelInsertion ? pass : notPass,
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => LevelScreen(index: index),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

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
        return Level1ePage();
      case 5:
        return Level2Page();
      case 6:
        return Level2bPage();
      case 7:
        return Level2cPage();
      case 8:
        return Level2dPage();
      case 9:
        return DragScreen();
      case 10:
        return DragScreen2();
      default:
        return Scaffold();
    }
  }
}

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
