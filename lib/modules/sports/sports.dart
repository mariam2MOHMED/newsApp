import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import '../resuable_components/resuable_components.dart';
class SportScreen extends StatelessWidget {
  const SportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list=NewsCubit.get(context).sports;
        return
          articleBulider(list,context);
      },


    );
  }
}
