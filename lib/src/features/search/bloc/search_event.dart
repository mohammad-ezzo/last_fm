part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class GetSearchResult extends SearchEvent {
  final String query;
  GetSearchResult(this.query);
}
class GetMoreSearchResult extends SearchEvent {
  final String query;
  GetMoreSearchResult(this.query);
}
