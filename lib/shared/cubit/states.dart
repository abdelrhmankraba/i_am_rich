import 'package:flutter/material.dart';
import 'package:i_am_rich/shared/cubit/cubit.dart';

abstract class AppState {}

class AppInitialState extends AppState{}

class AppChangeBottomNavBar extends AppState{}
class AppCreateDatabase extends AppState{}
class AppInsertDatabase extends AppState{}
class AppUpdateDatabase extends AppState{}
class AppGetDatabase extends AppState{}
class AppGetLoadingDatabase extends AppState{}

class AppChangeBottomSheetState extends AppState{}

class AppChangeModeState extends AppState{}