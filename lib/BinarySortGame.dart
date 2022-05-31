import 'package:binarysearch/global.dart';
import 'package:flutter/material.dart';

import 'BinarySearchGame/level1.dart';
import 'BinarySearchGame/level1/level1b.dart';
import 'BinarySearchGame/level1/level1c.dart';
import 'BinarySearchGame/level1/level1d.dart';
import 'BinarySearchGame/level2/level2.dart';
import 'BinarySearchGame/level2/level2b.dart';
import 'BinarySearchGame/level2/level2c.dart';

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
        7,
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Levels"),
      ),
      body: ListView.builder(
        itemCount: levels.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(levels[index].title),
            tileColor: index < levelBinary ? pass : notPass,
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
