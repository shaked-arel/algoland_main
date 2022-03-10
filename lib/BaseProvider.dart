import 'package:flutter/material.dart';
import 'wait.dart';

class BaseProvider extends ChangeNotifier {
  double _execSpeed = 0.5;
  //getter
  double get ExecSpeed => _execSpeed;
  //setter
  set ExecSpeed(double currentSpeed) {
    if (currentSpeed > 1) {
      _execSpeed = 1;
      return;
    }
    if (currentSpeed < 0) {
      _execSpeed = 0;
      return;
    }
    _execSpeed = currentSpeed;
    notifyListeners();
  }

  Future pause() async {
    await wait(speed: ExecSpeed);
  }
}
