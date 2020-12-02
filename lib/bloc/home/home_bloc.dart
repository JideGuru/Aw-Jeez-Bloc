import 'package:aw_geez/bloc/home/home_event.dart';
import 'package:aw_geez/bloc/home/home_state.dart';
import 'package:aw_geez/data/repository/home/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepository repository;

  HomeBloc({@required this.repository}) : super(null);

  @override
  HomeState get initialState => InitialHomeState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event,) async* {
    if (event is FetchHomeEvent) {
      yield LoadingHomeState();
    }
    try {
      Map response = await repository.getAllCharacters();
      yield LoadedHomeState(response: response);
    } catch (e) {
      yield ErrorHomeState(message: e.toString());
    }
  }
}