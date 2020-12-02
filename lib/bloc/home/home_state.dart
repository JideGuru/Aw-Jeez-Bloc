import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class InitialHomeState extends HomeState {
  @override
  List<Object> get props => [];
}

class LoadingHomeState extends HomeState {
  @override
  List<Object> get props => null;
}

class LoadedHomeState extends HomeState {
  Map response;
  LoadedHomeState({@required this.response});

  @override
  List<Object> get props => [response];
}

class ErrorHomeState extends HomeState {
  String message;
  ErrorHomeState({@required this.message});
  @override
  List<Object> get props => [message];
}