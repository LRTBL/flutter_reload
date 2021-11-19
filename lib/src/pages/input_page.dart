import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = "";
  String _email = "";
  String _date = "";
  String? _powerSelect = "Volar";
  final _inputDate = TextEditingController();
  final List<String> _powers = ['Volar', 'Rayo X', 'Super Poderes'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        children: <Widget>[
          _createInput(),
          const Divider(),
          _createEmail(),
          const Divider(),
          _createPassword(),
          const Divider(),
          _createDate(context),
          const Divider(),
          _createDropDown(),
          const Divider(),
          _createPerson()
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      // autofocus: true,
      onChanged: (value) {
        setState(() => _nombre = value);
      },
      textCapitalization: TextCapitalization.characters,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'solo es el nombre',
        suffixIcon: const Icon(Icons.accessibility),
        icon: const Icon(Icons.account_circle),
      ),
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text("Nombre de ella es $_nombre"),
      subtitle: Text("Correo es $_email y la fecha es $_date"),
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        setState(() => _email = value);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        counter: Text('Letras ${_email.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Correo',
        helperText: 'solo es el correo',
        suffixIcon: const Icon(Icons.accessibility),
        icon: const Icon(Icons.account_circle),
      ),
    );
  }

  Widget _createPassword() {
    return TextField(
      obscureText: true,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        setState(() => _email = value);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        counter: Text('Letras ${_email.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Correo',
        helperText: 'solo es el correo',
        suffixIcon: const Icon(Icons.accessibility),
        icon: const Icon(Icons.account_circle),
      ),
    );
  }

  Widget _createDate(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputDate,
      keyboardType: TextInputType.emailAddress,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        counter: Text('Letras ${_email.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Correo',
        helperText: 'solo es el correo',
        suffixIcon: const Icon(Icons.accessibility),
        icon: const Icon(Icons.account_circle),
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2022),
      locale: const Locale('es', 'ES'),
    );
    if (picked != null) {
      _date = picked.toString();
      _inputDate.text = _date;
    }
  }

  List<DropdownMenuItem<String>> _getOptionsDroDown() {
    return _powers
        .map((String power) =>
            DropdownMenuItem(child: Text(power), value: power))
        .toList();
  }

  Widget _createDropDown() {
    return DropdownButton(
      isExpanded: true,
      value: _powerSelect,
      items: _getOptionsDroDown(),
      onChanged: (String? opt) {
        setState(() {
          _powerSelect = opt;
        });
      },
    );
  }
}
