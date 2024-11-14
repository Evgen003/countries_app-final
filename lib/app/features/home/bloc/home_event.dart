part of "home_bloc.dart";

sealed class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class HomeLoad extends HomeEvent {
  const HomeLoad({this.completer});
  final Completer? completer;
  @override
  List<Object> get props => [];
}

class HomeLoadAdd extends HomeEvent {
  const HomeLoadAdd({this.completer});
  final Completer? completer;
  @override
  List<Object> get props => [];
}

class HomeLoadBack extends HomeEvent {
  const HomeLoadBack({this.completer});
  final Completer? completer;
  @override
  List<Object> get props => [];
}
