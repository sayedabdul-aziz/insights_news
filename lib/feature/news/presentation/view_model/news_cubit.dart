import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insights_news/core/api_services.dart';
import 'package:insights_news/feature/home/data/post_model/post_model.dart';
import 'package:insights_news/feature/news/presentation/view_model/news_states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInit());

  void getNews(String category) {
    emit(GetNewsLoadingState());

    try {
      ApiService().fetchPosts(category: category).then((value) {
        emit(GetNewsSuccessState(news: value));
      });
    } catch (e) {
      emit(GetNewsErrorState(error: e.toString()));
    }
  }
}
