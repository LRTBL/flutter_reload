import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/pages/alert_page.dart';
import 'package:flutter_application_test/src/pages/animated_gage.dart';
import 'package:flutter_application_test/src/pages/avatar_page.dart';
import 'package:flutter_application_test/src/pages/card_page.dart';
import 'package:flutter_application_test/src/pages/home_page.dart';
import 'package:flutter_application_test/src/pages/input_page.dart';
import 'package:flutter_application_test/src/pages/listview_page.dart';

Map<String, WidgetBuilder> renderRoutes() {
  return <String, WidgetBuilder>{
    "/": (BuildContext context) => const HomePage(),
    "alert": (BuildContext context) => const AlertPage(),
    "avatar": (BuildContext context) => const AvatarPage(),
    "card": (BuildContext context) => const CardPage(),
    "animated": (BuildContext context) => const AnimatedPage(),
    "inputs": (BuildContext context) => const InputPage(),
    "listview": (BuildContext context) => const ListViewPage(),
  };
}
