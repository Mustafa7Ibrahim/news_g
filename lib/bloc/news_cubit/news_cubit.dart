import 'package:audible_news/models/news.dart';
import 'package:audible_news/repository/news_repository/news_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this.newsRepository) : super(NewsInitial());

  final NewsRepository newsRepository;

  static NewsCubit get(context) => BlocProvider.of(context);

  Future getNews(String type) async {
    emit(NewsLoading());
    final responce = await newsRepository.getNews(type);
    responce.fold(
      (l) => emit(NewsError(l.props.first)),
      (r) => emit(NewsLoaded(r)),
    );
  }
}
