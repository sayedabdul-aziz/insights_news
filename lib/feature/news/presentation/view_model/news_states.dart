import 'package:insights_news/feature/home/data/post_model/post_model.dart';

class NewsStates {}

class NewsInit extends NewsStates {}

class GetNewsLoadingState extends NewsStates {}

class GetNewsSuccessState extends NewsStates {
  final PostModel? news;

  GetNewsSuccessState({required this.news});
}

class GetNewsErrorState extends NewsStates {
  final String error;

  GetNewsErrorState({required this.error});
}
