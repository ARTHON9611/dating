import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _searchActive = prefs.getBool('ff_searchActive') ?? _searchActive;
    });
    _safeInit(() {
      _hasClicked = prefs.getInt('ff_hasClicked') ?? _hasClicked;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _searchActive = false;
  bool get searchActive => _searchActive;
  set searchActive(bool _value) {
    _searchActive = _value;
    prefs.setBool('ff_searchActive', _value);
  }

  int _hasClicked = 0;
  int get hasClicked => _hasClicked;
  set hasClicked(int _value) {
    _hasClicked = _value;
    prefs.setInt('ff_hasClicked', _value);
  }

  Color _heartColor = Color(3003121663);
  Color get heartColor => _heartColor;
  set heartColor(Color _value) {
    _heartColor = _value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
