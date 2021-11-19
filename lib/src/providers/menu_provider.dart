import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  Future<List<dynamic>> loadData() async {
    final String data = await rootBundle.loadString("data/menu_opt.json");
    Map dataMap = json.decode(data);
    return dataMap['routes'];
  }
}

final menuProvider = _MenuProvider();
