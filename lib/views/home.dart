import 'package:aw_geez/bloc/home/bloc.dart';
import 'package:aw_geez/components/character_card.dart';
import 'package:aw_geez/components/errors/error_widget.dart';
import 'package:aw_geez/data/model/home/character.dart';
import 'package:aw_geez/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeBloc homeBloc;

  @override
  void initState() {
    super.initState();
    homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.add(FetchHomeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$appName")),
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is ErrorHomeState) {
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          // ignore: missing_return
          builder: (context, state) {
            if (state is InitialHomeState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is LoadingHomeState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is LoadedHomeState) {
              return buildBody(state.response);
            } else if (state is ErrorHomeState) {
              return MyErrorWidget(
                  refreshCallBack: () => homeBloc.add(FetchHomeEvent()));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  buildBody(Map res) {
    List characters = res['results'];
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      itemCount: characters.length,
      itemBuilder: (BuildContext context, int index) {
        Character character = Character.fromJson(characters[index]);
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: CharacterCard(character: character),
        );
      },
    );
  }
}
