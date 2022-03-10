import 'dart:ui';

Future SleepSum(int v1, int v2) {
  return Future.delayed(Duration(seconds: 1), () => v1 + v2);
}

Future wait({double speed = 0.5}) {
  final millisec = lerpDouble(100, 2000, speed)!.toInt();
  return Future.delayed(Duration(milliseconds: millisec));
}
