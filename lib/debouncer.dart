import 'dart:async';
import 'package:flutter/material.dart';

class Debouncer {
  final milliseconds;
  Timer _timer;
  VoidCallback action;

  run(VoidCallback action) {
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  Debouncer({this.milliseconds});
}
