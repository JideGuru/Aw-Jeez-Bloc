import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class FetchHomeEvent extends HomeEvent {
  @override
  List<Object> get props => null;
}
