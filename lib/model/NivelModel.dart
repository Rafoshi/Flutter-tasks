import 'dart:typed_data';

import 'package:flutter/foundation.dart';

class NivelModel extends ChangeNotifier{
  int _nivel = 0;

  int get nivel => _nivel;

  void upNivel(){
    _nivel++;
    notifyListeners();
  }
}