import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_abdallah/cubit_matrial_app/states_app.dart';
import 'package:news_api_abdallah/network/local/cache_helper.dart';

// class AppCubit extends Cubit<AppStatates>{
//
//   AppCubit():super(AppIntialState());
//   static  AppCubit get(context)=>BlocProvider.of(context);
//   bool isDark=false;
//   ThemeMode appMode=ThemeMode.dark;
//  void changeMode()
//  {
//    isDark=!isDark;
//    emit(AppChangeModeState());
//  }
//
// }
class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppIntialState());
  static AppCubit get(context)=>BlocProvider.of(context);
  bool isDark=true;
  void changeMode()
  {
    isDark=!isDark;
    emit(AppChangeModeState());
  }

}
