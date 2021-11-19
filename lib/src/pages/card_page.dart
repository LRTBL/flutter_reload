import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text("Cards"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: <Widget>[_cardType1(), _cardType1(), _cardType2()],
      ),
    );
  }

  Widget _cardType1() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            const ListTile(
              contentPadding: EdgeInsets.all(20),
              leading: Icon(
                Icons.ac_unit_rounded,
                color: Colors.redAccent,
              ),
              title: Text("SOy el titulo"),
              subtitle: Text(
                  "Subtitulo de amcñasmñsamasd as d asld asld asl dlas dlsa dlas ld asld asld sal dlas dlsa dlas dl asld asld lsa dlas dlas dl"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.red[100]),
                    ),
                    onPressed: () {},
                    child: const Text("Cancelar",
                        style: TextStyle(
                          color: Colors.redAccent,
                        ))),
                TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.red[100]),
                    ),
                    onPressed: () {},
                    child: const Text("OK",
                        style: TextStyle(
                          color: Colors.redAccent,
                        )))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _cardType2() {
    return Card(
      elevation: 5,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: <Widget>[
          const FadeInImage(
            placeholder: AssetImage("assets/jar-loading.gif"),
            image: NetworkImage(
              'https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
            ),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300,
            fit: BoxFit.fitHeight,
          ),
          Container(
            color: Colors.redAccent,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            child: const Text(
              "No tengo idea",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
