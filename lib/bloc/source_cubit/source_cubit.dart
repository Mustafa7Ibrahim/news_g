import 'package:audible_news/models/sources.dart';
import 'package:audible_news/repository/news_repository/news_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'source_state.dart';

class SourceCubit extends Cubit<SourceState> {
  SourceCubit(this.newsRepository) : super(SourceInitial());

  final NewsRepository newsRepository;

  static SourceCubit get(context) => BlocProvider.of(context);

  void getSources() async {
    emit(SourceLoading());
    final responce = await newsRepository.getSources();
    responce.fold(
      (l) => emit(SourceError(l.props.first)),
      (r) => emit(SourceLoaded(r)),
    );
  }
}
