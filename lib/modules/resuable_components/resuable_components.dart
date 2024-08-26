



import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_api_abdallah/network/local/cache_helper.dart';
import 'package:news_api_abdallah/web_view/web_view.dart';

import '../../shop_app/login/shop_login.dart';

Widget buildArticleItem(article,context)=>  InkWell(
  onTap: (){
 Navigator.push(context, MaterialPageRoute(builder:
     (context)=>MyWebViewScreen(article['url'])));
  },
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        Container(

          width: 120.0,

          height: 150.0,

          decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(16.0),

              image: DecorationImage(

                  image: NetworkImage('${article['urlToImage']}',),

                  fit: BoxFit.cover



              )

          ),

        ),

        SizedBox(width: 15.0,),

        Expanded(

          child: Container(

            height:150.0 ,

            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,

              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisSize: MainAxisSize.min,

              children: [

                Expanded(

                  child: Text('${article['title']}',

                    overflow: TextOverflow.ellipsis,

                    maxLines: 4,

                    style: Theme.of(context).textTheme.bodyLarge),

                ),

                SizedBox(height: 15.0,),

                Text('${article['publishedAt']}',style:

                Theme.of(context).textTheme.bodyLarge ,),

              ],

            ),

          ),

        )

      ],

    ),

  ),
);
Widget articleBulider(list,context)=> ConditionalBuilder(

  builder:(context)=>ListView.separated(
    physics:BouncingScrollPhysics() ,
    itemBuilder: (context,index)=>buildArticleItem(list[index],context),
    itemCount:list.length ,
    separatorBuilder:(context,index)=> Padding(
      padding: const EdgeInsets.only(top: 5.0,
          bottom: 5.0),
      child: Container(
        width: double.infinity,
        height: 2.5,
        color: Colors.grey,
      ),
    ),
  ),
  condition: list.length>0 ,
  fallback: (context)=>Center(child: CircularProgressIndicator()),
);
void navigateTo(context,widget)=>Navigator.push(context, widget);
extension NavigoterHelper on BuildContext{
  void push(Widget widget) {
    Navigator.of(this).push(
        MaterialPageRoute(builder: (context) => widget));
  }
}
void navigatorAndFinish(context,widget)=>Navigator.pushAndRemoveUntil(context,
    MaterialPageRoute(builder: (context)=>widget),
    (Route <dynamic> route)=>false,
);
void showTest(
    {required String text,
      required ToastState state,
    })=>Fluttertoast.showToast(
    msg:text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0
);
enum ToastState{SUCESS,ERROR,WARNING}
Color chooseToastColor(ToastState state){
  Color? color;
switch(state){

  case ToastState.SUCESS:
    color= Colors.green;
    break;
  case ToastState.ERROR:
    color= Colors.red;
    break;
  case ToastState.WARNING:
    color= Colors.yellow;
    break;
}
return color;
}
