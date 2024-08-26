import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_abdallah/cubit/cubit.dart';
import 'package:news_api_abdallah/cubit/states.dart';
import 'package:news_api_abdallah/modules/resuable_components/resuable_components.dart';
class SearchScreen extends StatelessWidget {

  var searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list=NewsCubit.get(context).search;
        return      Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                TextFormField(
                  controller: searchcontroller,
                  validator: (String? value){
                    if(value!.trim().isEmpty)
                    {
                      return "value must be not empty";
                    }
                    else
                    {
                      return null;
                    }
                  },
                  onChanged: (value){
                    NewsCubit.get(context).getSearch(value);
                  },
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    label: Text('Search'),
                  ),
                ),
                Expanded(child: articleBulider(list, context))
              ],
            ),
          ),
        );
      },


    );
//     return BlocConsumer<NewsCubit,NewsStates>(
// listener: (context,state){},
//       builder:(context,state){
//   var list=NewsCubit.get(context).search;
//   return   Scaffold(
//     appBar: AppBar(),
//     body: Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: TextFormField(
//             validator: (String? value){
//               if(value!.isEmpty)
//               {
//                 return "email must be not empty";
//               }
//               else
//               {
//                 return null;
//               }
//             },
//             onChanged: (value){
// NewsCubit.get(context).getSearch(value);
//             },
//             controller: searchcontroller,
//             decoration: InputDecoration(
//               suffixIcon: Icon(Icons.search_rounded),
//               border: OutlineInputBorder(),
//               label: Text('Search'),
//
//             ),
//           ),
//         ),
//         Expanded(child: articleBulider(list, context))
//       ],
//     ),
//   );
//       } ,
//     );
  }
}
