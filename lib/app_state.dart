import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  late SharedPreferences prefs;

  DocumentReference? bot =
      FirebaseFirestore.instance.doc('/users/PSCIISz9GzfhpcRESmSuJTXICX92');

  String apitoken = '';

  dynamic me;

  double percOb1 = 0.02;

  double percOb2 = 0.07;

  double percOb3 = 0.2;

  double scoreOb1 = 0.05;

  double scoreOb2 = 0.2;

  double scoreOb3 = 0.5;

  String exist = '1';

  List<dynamic> addTaskProdsOblg = [];

  List<dynamic> addTaskProdsGift = [];

  List<dynamic> addTaskListProdsSelect = [];

  dynamic taskList;

  String addTaskDateStart = 'Date Start...';

  String addTaskDateEnd = 'Date End...';

  int taskDropDownListId = 0;

  String taskDropDownListName = 'Select list...';

  int taskDropDownUserId = 0;

  String taskDropDownUserName = 'Select user...';

  String addTaskDateYear = 'Date Year...';
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
