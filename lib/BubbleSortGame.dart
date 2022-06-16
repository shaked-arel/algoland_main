import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bubbleSortGame/level1/main.dart';
import 'bubbleSortGame/level2/main.dart';
import 'bubbleSortGame/level1b/level1b.dart';
import 'bubbleSortGame/level1b/level1c.dart';
import 'bubbleSortGame/level1b/level1d.dart';
import 'bubbleSortGame/level2b/level2b.dart';
import 'bubbleSortGame/level2b/level2c.dart';
import 'bubbleSortGame/level2b/level2d.dart';
import 'bubbleSortGame/level3/level3b.dart';
import 'bubbleSortGame/level3/main.dart';
import 'config/palette.dart';
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
        10,
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
                      alignment: Alignment(-0.6,-0.8),
                      child: SizedBox(width: 75.0, height: 75.0,
                        child: FloatingActionButton(
                          onPressed: () {Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) => LevelScreen(index: 0),),);},
                          child: IconTheme(data: new IconThemeData(),
                            child: Text('1', style: GoogleFonts.robotoFlex(color: Palette.darkBlue2, fontWeight: FontWeight.bold, fontSize: 30)),
                          ), backgroundColor: Colors.white,),),),
                    Align(
                      alignment: Alignment(0,-0.8),
                      child: SizedBox(width: 70.0, height: 70.0,
                        child: FloatingActionButton(
                          onPressed: () {Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) => LevelScreen(index: 1),),);},
                          child: IconTheme(data: new IconThemeData(),
                            child: Text('2', style: GoogleFonts.robotoFlex(color: Palette.darkBlue2, fontWeight: FontWeight.bold, fontSize: 30)),
                          ), backgroundColor: Colors.white,),),),
                    Align(
                      alignment: Alignment(0.6,-0.8),
                      child: SizedBox(width: 70.0, height: 70.0,
                        child: FloatingActionButton(
                          onPressed: () {Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) => LevelScreen(index: 2),),);},
                          child: IconTheme(data: new IconThemeData(),
                            child: Text('3', style: GoogleFonts.robotoFlex(color: Palette.darkBlue2, fontWeight: FontWeight.bold, fontSize: 30)),
                          ), backgroundColor: Colors.white,),),),
                    Align(
                      alignment: Alignment(-0.6,-0.48),
                      child: SizedBox(width: 70.0, height: 70.0,
                        child: FloatingActionButton(
                          onPressed: () {Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) => LevelScreen(index: 3),),);},
                          child: IconTheme(data: new IconThemeData(),
                            child: Text('4', style: GoogleFonts.robotoFlex(color: Palette.darkBlue2, fontWeight: FontWeight.bold, fontSize: 30)),
                          ), backgroundColor: Colors.white,),),),
                    Align(
                      alignment: Alignment(0,-0.48),
                      child: SizedBox(width: 70.0, height: 70.0,
                        child: FloatingActionButton(
                          onPressed: () {Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) => LevelScreen(index: 4),),);},
                          child: IconTheme(data: new IconThemeData(),
                            child: Text('5', style: GoogleFonts.robotoFlex(color: Palette.darkBlue2, fontWeight: FontWeight.bold, fontSize: 30)),
                          ), backgroundColor: Colors.white,),),),
                    Align(
                      alignment: Alignment(0.6,-0.48),
                      child: SizedBox(width: 70.0, height: 70.0,
                        child: FloatingActionButton(
                          onPressed: () {Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) => LevelScreen(index: 5),),);},
                          child: IconTheme(data: new IconThemeData(),
                            child: Text('6', style: GoogleFonts.robotoFlex(color: Palette.darkBlue2, fontWeight: FontWeight.bold, fontSize: 30)),
                          ), backgroundColor: Colors.white,),),),
                    Align(
                      alignment: Alignment(-0.6,-0.16),
                      child: SizedBox(width: 70.0, height: 70.0,
                        child: FloatingActionButton(
                          onPressed: () {Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) => LevelScreen(index: 6),),);},
                          child: IconTheme(data: new IconThemeData(),
                            child: Text('7', style: GoogleFonts.robotoFlex(color: Palette.darkBlue2, fontWeight: FontWeight.bold, fontSize: 30)),
                          ), backgroundColor: Colors.white,),),),
                    Align(
                      alignment: Alignment(0,-0.16),
                      child: SizedBox(width: 70.0, height: 70.0,
                        child: FloatingActionButton(
                          onPressed: () {Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) => LevelScreen(index: 7),),);},
                          child: IconTheme(data: new IconThemeData(),
                            child: Text('8', style: GoogleFonts.robotoFlex(color: Palette.darkBlue2, fontWeight: FontWeight.bold, fontSize: 30)),
                          ), backgroundColor: Colors.white,),),),
                    Align(
                      alignment: Alignment(0.6,-0.16),
                      child: SizedBox(width: 70.0, height: 70.0,
                        child: FloatingActionButton(
                          onPressed: () {Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) => LevelScreen(index: 8),),);},
                          child: IconTheme(data: new IconThemeData(),
                            child: Text('9', style: GoogleFonts.robotoFlex(color: Palette.darkBlue2, fontWeight: FontWeight.bold, fontSize: 30)),
                          ), backgroundColor: Colors.white,),),),
                    Align(
                      alignment: Alignment(-0.6,0.16),
                      child: SizedBox(width: 70.0, height: 70.0,
                        child: FloatingActionButton(
                          onPressed: () {Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) => LevelScreen(index: 9),),);},
                          child: IconTheme(data: new IconThemeData(),
                            child: Text('10', style: GoogleFonts.robotoFlex(color: Palette.darkBlue2, fontWeight: FontWeight.bold, fontSize: 30)),
                          ), backgroundColor: Colors.white,),),),
                  ],))));}}

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Levels"),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios),
//           color: Colors.white,
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),),
//       body: ListView.builder(
//         itemCount: levels.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(levels[index].title),
//             tileColor: index < levelBubble ? pass : notPass,
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
        return Level2Page();
      case 5:
        return Level2bPage();
      case 6:
        return Level2cPage();
      case 7:
        return Level2dPage();
      case 8:
        return DragScreen();
      case 9:
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
