part of 'source_cubit.dart';

abstract class SourceState extends Equatable {
  const SourceState();

  @override
  List<Object> get props => [];
}

class SourceInitial extends SourceState {}

class SourceLoading extends SourceState {}

class SourceLoaded extends SourceState {
  final ListOfSources listOfSources;

  SourceLoaded(this.listOfSources);

  @override
  List<Object> get props => [listOfSources];
}

class SourceError extends SourceState {
  final String error;

  SourceError(this.error);

  @override
  List<Object> get props => [error];
}
