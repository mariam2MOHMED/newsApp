import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_abdallah/cubit/states.dart';
import 'package:news_api_abdallah/modules/business/business.dart';
import 'package:news_api_abdallah/modules/science/science.dart';
import 'package:news_api_abdallah/modules/setting/setting.dart';
import 'package:news_api_abdallah/modules/sports/sports.dart';
import 'package:news_api_abdallah/network/remote/dio_helper.dart';

// class NewsCubit extends Cubit<NewsStates>{
//
//   NewsCubit():super(NewsIntialStates());
//   static  NewsCubit get(context)=>BlocProvider.of(context);
//   int currindex=0;
//   List<BottomNavigationBarItem>items=[
//     BottomNavigationBarItem(icon: Icon(Icons.business),
//         label: 'Business'),
//     BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'Sports',),
//     BottomNavigationBarItem(icon: Icon(Icons.science),label: 'Science'),
//     BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Setting'),
//
//   ];
//   List<Widget>screens=[
//     BusinessScreen(),
//     SportScreen(),
//     ScienceScreen(),
//     SettingScreen(),
//   ];
//   void changeBottomNav(index){
//     currindex=index;
//     if(index==1)
//       {
//         getSports();
//       }
//     if(index==2)
//     {
//       getScience();
//     }
//     emit(NewsBottomNavStates());
//   }
//   List<dynamic> business=[];
//   void getBusiness(){
//     emit(NewsGetBusinessLoadingStates());
//     DioHelper.getData(
//         url: 'v2/top-headlines',
//         query: {
//           'country':'us',
//           'category':'business',
//           'apiKey':'595d66d60ee84697958e84d40f07ffd3'}).then((value) {
//
//       // print(value.data.toString());
//       business=value.data['articles'];
//       print(business);
//       print(value.data['totalResults']);
//       emit(NewsGetBusinessSucessStates());
//     }).catchError((error){
//       emit(NewsGetBusinessErrorStates(error.toString()));
//       print(error.toString());
//     });
//   }
//   List< dynamic> sports=[];
//   void getSports(){
//     emit(NewsSportsLoadingStates());
//  if(sports.length==0)
//    {
//      DioHelper.getData(
//          url: 'v2/top-headlines',
//          query: {
//            'country':'us',
//            'category':'sports',
//            'apiKey':'595d66d60ee84697958e84d40f07ffd3'}).then((value) {
//
//        // print(value.data.toString());
//        sports=value.data['articles'];
//        print(sports);
//        print(value.data['totalResults']);
//        emit(NewsSportsSucessStates());
//      }).catchError((error){
//        emit(NewsSportsErrorStates(error.toString()));
//        print(error.toString());
//      });
//    }
//  else {
//    emit(NewsSportsSucessStates());
//  }
//   }
//   List< dynamic> science=[];
//   void getScience(){
//     emit(NewsScienceLoadingStates());
// if(science.length==0)
//   {
//     DioHelper.getData(
//         url: 'v2/top-headlines',
//         query: {
//           'country':'us',
//           'category':'science',
//           'apiKey':'595d66d60ee84697958e84d40f07ffd3'}).then((value) {
//
//       // print(value.data.toString());
//       science=value.data['articles'];
//       print(science);
//       print(value.data['totalResults']);
//       emit(NewsScienceSucessStates());
//     }).catchError((error){
//       emit(NewsScienceErrorStates(error.toString()));
//       print(error.toString());
//     });
//   }
// else{
//   emit(NewsScienceSucessStates());
// }
//   }
// }

///////
class NewsCubit extends Cubit<NewsStates>{
  NewsCubit():super(NewsIntialState());
  static  NewsCubit get(context)=>BlocProvider.of(context);
  int currindex=0;
  List<Widget>screens=[
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),

  ];
  List<BottomNavigationBarItem>items=[
    BottomNavigationBarItem(icon: Icon(Icons.business),label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science),label: 'Science'),

  ];
  void changeBottomNav(index){
    if(index==1)
      {
        getSports();
      }
    if(index==2)
    {
      getScience();
    }
    currindex=index;
    emit(NewsBottomNavState());
  }
  List <dynamic> business=[];
  void getBusiness(){
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: { 'country':'us',
          'category':'business',
           'apiKey':'595d66d60ee84697958e84d40f07ffd3'}
    ).then((value) {
    business=value.data['articles']  ;
    print(business);
    print(value.data['totalResults']);
    emit(NewsGetBusinessSucessState());
    }
    ).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessFailureState(error));
    });
  }
  List <dynamic> sports=[];
  void getSports(){
    emit(NewsSportsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: { 'country':'us',
      'category':'sports',
      'apiKey':'595d66d60ee84697958e84d40f07ffd3'}
    ).then((value) {
      sports=value.data['articles']  ;
      print(business);
      print(value.data['totalResults']);
      emit(NewsSportsSucessState());
    }
    ).catchError((error){
      print(error.toString());
      emit(NewsSportsFailureState(error));
    });
  }
  List <dynamic> science=[];
  void getScience() {
    emit(NewsScienceLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: { 'country': 'us',
      'category': 'science',
      'apiKey': '595d66d60ee84697958e84d40f07ffd3'}
    ).then((value) {
      science = value.data['articles'];
      print(business);
      print(value.data['totalResults']);
      emit(NewsScienceSucessState());
    }
    ).catchError((error) {
      print(error.toString());
      emit(NewsScienceFailureState(error));
    });
  }
  List<dynamic> search=[];
  void getSearch(String? value){
    emit(NewsSearchLoadingState());
    DioHelper.getData(url: 'v2/everything', query:{
      'q':'$value'!,
    'apiKey':'595d66d60ee84697958e84d40f07ffd3'}
    ).then((value) {
      search=value.data['articles'];

      print(search);
      print(value.data['totalResults']);
      emit(NewsSearchSucessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsSearchFailureState(error));
    });
  }
  // List <dynamic> search=[];
  // void getSearch(String? value) {
  //   // search=[];
  //   emit(NewsSearchLoadingState());
  //   DioHelper.getData(url: 'v2/everything', query: {
  //     'q':'$value'!,
  //     'apiKey':'595d66d60ee84697958e84d40f07ffd3'}
  //   ).then((value) {
  //     search=value.data['articles']  ;
  //     print(search);
  //     print(value.data['totalResults']);
  //     emit(NewsSearchSucessState());
  //   }
  //   ).catchError((error){
  //     print(error.toString());
  //     emit(NewsSearchFailureState(error));
  //   });
  // }
}

