import 'package:flutter/material.dart';

enum SortState {
  open,
  sort,
  sorted,
  pivot,
}

class SortModel {
  SortModel(this.value) : key = GlobalKey() {
    state = SortState.open;
    color = Colors.black;
  }

  final int value;
  final GlobalKey key;
  SortState state = SortState.open;
  Color color = Colors.black;

  void reset() {
    state = SortState.open;
    color = Colors.black;
  }

  void sort() {
    state = SortState.sort;
    color = Colors.cyan;
  }

  void sorted() {
    state = SortState.sorted;
    color = Colors.orange;
  }

  void pivot() {
    state = SortState.pivot;
    color = Colors.pink;
  }
}
