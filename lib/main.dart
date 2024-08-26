import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_api_abdallah/cubit_matrial_app/cubit_app.dart';
import 'package:news_api_abdallah/cubit_matrial_app/states_app.dart';
import 'package:news_api_abdallah/network/local/cache_helper.dart';
import 'package:news_api_abdallah/network/remote/dio_helper.dart';
import 'package:news_api_abdallah/news_app/news_app.dart';
import 'package:news_api_abdallah/shop_app/cubit/login_cubit/cubit.dart';
import 'package:news_api_abdallah/shop_app/cubit/shop_layout_cubit/cubit_shop_layout.dart';
import 'package:news_api_abdallah/shop_app/login/shop_login.dart';
import 'package:news_api_abdallah/shop_app/screens/on_boarding/on_boarding_screen.dart';
import 'package:news_api_abdallah/shop_app/screens/shop_layout/shop_layout.dart';


import 'package:news_api_abdallah/shop_app/shop_network/dio_helper_shop/dio_helper_shop.dart';

import 'bloc_obervable/bloc_observable.dart';
import 'cubit/cubit.dart';
import 'modules/resuable_components/custom_text_field.dart';
import 'modules/resuable_components/themes.dart';
//https://newsapi.org/v2/top-headlines?country=us&apiKey=595d66d60ee84697958e84d40f07ffd3
//https://newsapi.org/v2/everything?q=tesla&apiKey=595d66d60ee84697958e84d40f07ffd3
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await DioHelperShop.init();
  // DioHelper.init();
  //onBoardingScreen
  // await CacheHelper.init();
  // bool? isDark=CacheHelper.getData(key: 'isDark ');
  // Widget widget;
  // bool? onBoardingScreen=CacheHelper.getData(key: 'onBoardingScreen');
  //  token=CacheHelper.getData(key: 'token');
  // print(onBoardingScreen);
  // if(onBoardingScreen!=null){
  //   if(token!=null){
  //     widget=ShopLayoutScreen();
  //
  //   }
  //   else
  //     {
  //       widget=ShopLogin();
  //     }



  runApp(MyApp(

 // onBoardingScreen!:onBoardingScreen
  ));
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

 MyApp(

     );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NewsCubit()..getBusiness()..getSports()..getScience()),
        BlocProvider(create:  (BuildContext context) =>AppCubit()),
        BlocProvider(create:  (BuildContext context) =>ShopLayoutCubit(

        )..getHomeData()),
//ShopLayoutCubit

      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            home: NewsApp(),
            theme:  lightTheme,
            darkTheme: darkTheme,
            themeMode: AppCubit.get(context).isDark?ThemeMode.light:ThemeMode.dark,
            // themeMode: AppCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
            // themeMode: AppCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
          );
        },

      ),
    );
  }
}
