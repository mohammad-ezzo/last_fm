part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class LoadingResults extends SearchState {}

class ResultReady extends SearchState {
  final List<Track> result;
  final bool hasReachedMax;
  
  ResultReady({required this.result, required this.hasReachedMax});
}

class ErrorInSearch extends SearchState {
  final String error;
  ErrorInSearch(this.error);
}
