import 'package:flutter/material.dart';
import 'SortProvider.dart';
import 'SortModel.dart';

class BubbleSortProvider extends SortProvider {
  @override
  void sort() {
    super.sort();
    _startSort(numbers);
  }

  Future _startSort(List<SortModel> num) async {
    bool sorted = false;
    int count = 0;

    while (!sorted) {
      sorted = true;
      for (int i = 0; i < num.length - 1 - count; i++) {
        SortingNodes(i, i + 1);
        notifyListeners();
        if (num[i].value > num[i + 1].value) {
          await pause();
          final temp = num[i];
          num[i] = num[i + 1];
          num[i + 1] = temp;
          sorted = false;
          notifyListeners();
        }
        await pause();
        NodesNotSorted(0, i);
      }
      SortedNode(num.length - 1 - count);
      count++;
    }
    SortedNodes(0, num.length - 1 - count);
    StateToSorted();
    notifyListeners();
  }
}
