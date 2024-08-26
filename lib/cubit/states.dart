// abstract class NewsStates{}
// class NewsIntialStates extends NewsStates{}
// class NewsBottomNavStates extends NewsStates{}
// class NewsGetBusinessSucessStates extends NewsStates{}
// class NewsGetBusinessLoadingStates extends NewsStates{}
// class NewsGetBusinessErrorStates extends NewsStates{
//   final String error;
//   NewsGetBusinessErrorStates(this.error);
// }
// class NewsSportsSucessStates extends NewsStates{}
// class NewsSportsLoadingStates extends NewsStates{}
// class NewsSportsErrorStates extends NewsStates{
//   final String error;
//   NewsSportsErrorStates(this.error);
// }
// class NewsScienceSucessStates extends NewsStates{}
// class NewsScienceLoadingStates extends NewsStates{}
// class NewsScienceErrorStates extends NewsStates{
//   final String error;
//   NewsScienceErrorStates(this.error);
//
// }
////
abstract class NewsStates{}
class NewsIntialState extends NewsStates{}
class NewsBottomNavState extends NewsStates{}
class NewsGetBusinessLoadingState extends NewsStates{}
class NewsGetBusinessSucessState extends NewsStates{}
class NewsGetBusinessFailureState extends NewsStates{
  final String error;

  NewsGetBusinessFailureState(this.error);
}
class NewsSportsLoadingState extends NewsStates{}
class NewsSportsSucessState extends NewsStates{}
class NewsSportsFailureState extends NewsStates{
  final String error;

  NewsSportsFailureState(this.error);
}
class NewsScienceLoadingState extends NewsStates{}
class NewsScienceSucessState extends NewsStates{}
class NewsScienceFailureState extends NewsStates{
  final String error;

  NewsScienceFailureState(this.error);
 }
// class NewsSearchLoadingState extends NewsStates{}
// class NewsSearchSucessState extends NewsStates{}
// class NewsSearchFailureState extends NewsStates{
//   final String error;
//
//   NewsSearchFailureState(this.error);
// }
class NewsSearchLoadingState extends NewsStates{}
class NewsSearchSucessState extends NewsStates{}
class NewsSearchFailureState extends NewsStates{
  final String error;

  NewsSearchFailureState(this.error);
}