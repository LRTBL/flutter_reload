import 'package:flutter/material.dart';

class AvatarPage extends StatefulWidget {
  const AvatarPage({Key? key}) : super(key: key);

  @override
  State<AvatarPage> createState() => _AvatarPageState();
}

class _AvatarPageState extends State<AvatarPage> {
  double _siler = 100.0;
  bool _check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AVATAR PAGE"),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://depor.com/resizer/pfVziOV4X8Vu9nwknDc-oNItlB8=/1200x900/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/6Y2EDIISGFGVFANEVDCR5LCG34.jpg"),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: const CircleAvatar(
              child: Text("FC"),
              backgroundColor: Colors.redAccent,
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: <Widget>[
            SliderTheme(
              data: SliderTheme.of(context)
                  .copyWith(valueIndicatorColor: Colors.redAccent),
              child: Slider(
                activeColor: Colors.red,
                inactiveColor: Colors.redAccent[100],
                label: 'Tamaño',
                divisions: 1000,
                value: _siler,
                onChanged: (_check)
                    ? (value) {
                        setState(() => _siler = value);
                      }
                    : null,
                min: 100.0,
                max: 300.0,
              ),
            ),
            CheckboxListTile(
                title: const Text('Bloquear Slider'),
                value: _check,
                checkColor: Colors.white,
                activeColor: Colors.red,
                onChanged: (val) {
                  setState(() => _check = val!);
                }),
            SwitchListTile(
                title: const Text('Bloquear Slider'),
                value: _check,
                activeColor: Colors.red,
                onChanged: (val) {
                  setState(() => _check = val);
                }),
            Expanded(
              child: FadeInImage(
                width: _siler,
                image: const NetworkImage(
                    "https://depor.com/resizer/pfVziOV4X8Vu9nwknDc-oNItlB8=/1200x900/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/6Y2EDIISGFGVFANEVDCR5LCG34.jpg"),
                placeholder: const AssetImage("assets/jar-loading.gif"),
                fadeInDuration: const Duration(milliseconds: 200),
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
