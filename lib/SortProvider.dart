import 'SortModel.dart';
import 'package:flutter/material.dart';
import 'BaseProvider.dart';

class SortProvider extends BaseProvider {
  bool _isSorted = false;
  bool get isSorted => _isSorted;

  bool _isSorting = false;
  bool get isSorting => _isSorting;

  List<SortModel> numbers = [
    SortModel(14),
    SortModel(32),
    SortModel(79),
    SortModel(94),
    SortModel(71),
    SortModel(92),
    SortModel(10),
    SortModel(36),
    SortModel(61),
    SortModel(2),
    SortModel(84),
    SortModel(28),
  ];

  @mustCallSuper
  void sort() {
    reset();
    _isSorting = true;
  }

  void reset() {
    _isSorted = false;
    _isSorting = false;
    for (final number in numbers) {
      number.reset();
    }
    numbers.shuffle();
    notifyListeners();
  }

  void NodesNotSorted(int left, int right) {
    if (left < 0 || right > numbers.length - 1 || left > right) {
      return;
    }
    for (var i = left; i <= right; i++) {
      numbers[i].reset();
    }
  }

  void SortingNodes(int i, int j) {
    numbers[i].sort();
    numbers[j].sort();
  }

  void SortedNodes(int left, int right) {
    for (var i = left; i <= right; i++) {
      numbers[i].sorted();
    }
  }

  void SortedNode(int i) {
    numbers[i].sorted();
  }

  void PivotNode(int i) {
    numbers[i].pivot();
  }

  void StateToSorted() {
    _isSorted = true;
    _isSorting = false;
  }

  void StateToSortedAndRender() {
    _isSorted = true;
    _isSorting = false;
    notifyListeners();
  }
}
