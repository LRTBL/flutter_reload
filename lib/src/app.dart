import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/pages/alert_page.dart';
import 'package:flutter_application_test/src/routes/routes.dart';
import "package:flutter_localizations/flutter_localizations.dart";

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale('es', 'ES')],
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.blueGrey),
      ),
      routes: renderRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) => const AlertPage());
      },
    );
  }
}
