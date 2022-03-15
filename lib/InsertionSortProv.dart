import 'package:flutter/material.dart';
import 'SortProvider.dart';
import 'SortModel.dart';

class InsertionSortProvider extends SortProvider {
  @override
  void sort() {
    super.sort();
    _startSort(numbers);
  }

  Future _startSort(List<SortModel> num) async {
    //bool sorted = false;
    //int count = 0;

    //while (!sorted) {
    //sorted = true;
    for (int i = 0; i < num.length; i++) {
      for (var j = i; j > 0 && num[j].value < num[j - 1].value; j--) {
        SortingNodes(j, j - 1);
        notifyListeners();
        //if (num[i].value > num[i + 1].value) {
        await pause();
        final temp = num[j];
        num[j] = num[j - 1];
        num[j - 1] = temp;
        //sorted = false;
        notifyListeners();
        //}
        await pause();
        NodesNotSorted(0, i);
      }
    }
    //SortedNode(num.length - 1 - count);
    //count++;
    //}
    //SortedNodes(0, num.length - 1 - count);
    StateToSorted();
    notifyListeners();
  }
}
