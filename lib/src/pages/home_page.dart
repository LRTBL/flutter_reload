import 'package:flutter/material.dart';
import 'package:flutter_application_test/src/providers/menu_provider.dart';
import 'package:flutter_application_test/src/utils/icon_string_uitil.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  List<Widget> _renderListTile(List<dynamic> data, BuildContext context) {
    return data.map((route) {
      return Column(children: <Widget>[
        ListTile(
          title: Text(route['text'] as String),
          leading: getIcon(route['icon'] as String),
          trailing: const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.blue,
          ),
          onTap: () {
            Navigator.pushNamed(context, route['route'] as String);
            // final route = MaterialPageRoute(builder: (context) {
            //   return const AlertPage();
            // });
            // Navigator.push(context, route);
          },
        ),
        const Divider(),
      ]);
    }).toList();
  }

  Widget _list() {
    return FutureBuilder(
      future: menuProvider.loadData(),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return snapshot.hasData
            ? ListView(
                children: _renderListTile(snapshot.data!, context),
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Componentes")),
      body: _list(),
    );
  }
}
