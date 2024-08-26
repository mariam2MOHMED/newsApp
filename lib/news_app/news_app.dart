import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_abdallah/cubit/cubit.dart';
import 'package:news_api_abdallah/cubit/states.dart';
import 'package:news_api_abdallah/cubit_matrial_app/cubit_app.dart';
import 'package:news_api_abdallah/modules/resuable_components/resuable_components.dart';
import 'package:news_api_abdallah/network/remote/dio_helper.dart';

import '../modules/search/search.dart';
class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>
      (
      listener: (context,state){},
      builder:(context,state){
        NewsCubit newsCubit=BlocProvider.of(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('NewsApp',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0
            ),),
            actions: [
              IconButton(onPressed: (){
context.push(SearchScreen());
              }, icon: Icon(Icons.search_rounded)),
              IconButton(onPressed: (){
                AppCubit.get(context).changeMode();
              }, icon: Icon(Icons.brightness_4_rounded)),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: newsCubit.items,
            currentIndex: newsCubit.currindex,
            onTap: (index){
              newsCubit.currindex=index;
              newsCubit.changeBottomNav(index);
            },

          ),
          body: newsCubit.screens[newsCubit.currindex],
        );
      } ,

    );
    // return BlocProvider(
    //   create: (BuildContext context) =>NewsCubit()..getBusiness()..getSports()..getScience(),
    //   child: BlocConsumer<NewsCubit,NewsStates>(
    //     listener: (context,state){},
    //     builder: (context,state){
    //       NewsCubit newsCubit =BlocProvider.of(context);
    //       return Scaffold(
    //
    //         appBar: AppBar(
    //           title: Text('NewsApp'),
    //           actions: [
    //             IconButton(onPressed: (){},
    //                 icon: Icon( Icons.search_rounded)),
    //             IconButton(onPressed: (){
    //            AppCubit.get(context).changeMode();
    //             },
    //                 icon: Icon( Icons.brightness_4_rounded))
    //           ],
    //         ),
    //         bottomNavigationBar: BottomNavigationBar(
    //           elevation: 0.0,
    //
    //
    //           onTap: (index){
    //             newsCubit.currindex=index;
    //             newsCubit.changeBottomNav(index);
    //           },
    //           currentIndex: newsCubit.currindex,
    //           items: newsCubit.items,
    //         ),
    //
    //         body: newsCubit.screens[newsCubit.currindex],
    //       );
    //
    //     },
    //
    //   ),
    // );

  }
}
