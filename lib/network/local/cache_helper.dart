// import 'package:shared_preferences/shared_preferences.dart';
//
// class CacheHelper{
//   static SharedPreferences? sharedPreferences;
//   static init()async{
//     sharedPreferences=await SharedPreferences.getInstance();
//   }
//   static Future<bool> putBoolen({
//     required String? key,
//     required bool? value,
// })async{
//     return await sharedPreferences!.setBool(key!, value!);
//   }
//  static dynamic?  getData({
//     required String? key,
// })
//   {
// return sharedPreferences!.get(key!);
//   }
//   static Future<bool>saveData({
//     required String? key,
//     required dynamic? value,
//
// })async{
//     if (value! is String) {
//       return await sharedPreferences!.setString(key!, value as String);
//     }
//     if (value! is int) {
//       return await sharedPreferences!.setInt(key!, value! as int );
//     }
//     if (value! is bool) {
//       return await sharedPreferences!.setBool(key!, value! as bool );
//     }
//     return await sharedPreferences!.setDouble(key!, value! as double  );
//   }
//   static Future<bool> clearData({
//     required String key,
// })async{
//  return await sharedPreferences!.remove(key) ;
//   }
// }