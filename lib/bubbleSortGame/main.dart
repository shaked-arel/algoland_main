import 'package:flutter/material.dart';
import '../level1/main.dart';
import '../level2/main.dart';
import 'level1b/level1b.dart';
import 'level1b/level1c.dart';
import 'level1b/level1d.dart';
import 'level2b/level2b.dart';
import 'level2b/level2c.dart';
import 'level2b/level2d.dart';
import 'level3/level3b.dart';
import 'level3/main.dart';
import 'normalNumber.dart';

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
            title: 'Level $index ',
            description: "description for level $index"),
      ),
    ),
  ));
}

class TodoScreen extends StatelessWidget {
  final List<Todo> levels;

  TodoScreen({required this.levels});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Levels"),
      ),
      body: ListView.builder(
        itemCount: levels.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(levels[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LevelScreen(index: index),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

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
