import 'package:aw_geez/bloc/home/bloc.dart';
import 'package:aw_geez/data/repository/home/home_repository.dart';
import 'package:aw_geez/theme/theme_config.dart';
import 'package:aw_geez/util/constants.dart';
import 'package:aw_geez/views/home.dart';
import 'package:aw_geez/views/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: themeData(ThemeConfig.lightTheme),
      // darkTheme: themeData(ThemeConfig.darkTheme),
      home: Splash(),
      routes: {
        '/home': (context) => BlocProvider(
          create: (context) => HomeBloc(repository: HomeRepositoryImpl()),
          child: Home(),
        ),
      },
    );
  }

  ThemeData themeData(ThemeData theme) {
    return theme.copyWith(
      textTheme: GoogleFonts.sourceSansProTextTheme(theme.textTheme),
    );
  }
}
