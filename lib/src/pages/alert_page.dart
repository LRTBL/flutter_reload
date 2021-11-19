import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ALERT PAGE"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Mostrar alerta"),
          onPressed: () => _showAlert(context,
              title: 'Nuevamente yoddddddddddddddssss ssssssssddd',
              // ignore: avoid_print
              handleOk: () => print('HOla mundo')),
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            shape: const StadiumBorder(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_location),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showAlert(BuildContext context,
      {required String title, required VoidCallback handleOk}) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Text('Contenido'),
                FlutterLogo(size: 100)
              ],
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Cancelar")),
              TextButton(onPressed: handleOk, child: const Text("OK")),
            ],
          );
        });
  }
}
