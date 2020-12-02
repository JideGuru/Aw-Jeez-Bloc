import 'dart:convert';

import 'package:aw_geez/util/constants.dart';
import 'package:http/http.dart' as http;

abstract class HomeRepository {
  Future<Map> getAllCharacters();
}

class HomeRepositoryImpl extends HomeRepository {
  @override
  Future<Map> getAllCharacters() async {
    var res = await http.get(characterUrl);
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      throw (jsonDecode(res.body));
    }
  }
}
