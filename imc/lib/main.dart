import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerAltura = TextEditingController();

  String _info = "imc";

  void _limparCampos(){
    setState(() {
      controllerAltura.text = "";
      controllerPeso.text = "";
      _info = "imc";
    });
  }

  void _calcularIMC(){
    setState(() {
      double altura = double.parse(controllerAltura.text) / 100;
      double peso = double.parse(controllerPeso.text);
      double imc = peso / (altura * altura);
      _info = _avaliarIMC(imc);
    });
  }

  String _avaliarIMC(double imc){

    if (imc < 18.6){
      return "Abaixo do Peso, IMC(${imc.toString()})";
    }

    return "Erro ao calcular";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora de IMC"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () { _limparCampos(); },
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.person_outline,
                size: 120.0,
                color: Colors.black87,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Peso (Kg)',
                  ),
                  controller: controllerPeso,
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Altura (cm)',
                ),
                controller: controllerAltura,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 45.0,
                  child: RaisedButton(
                    onPressed: () { _calcularIMC(); },
                    color: Colors.blueAccent,
                    child: Text(
                      "Calcular",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Text(
                _info,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blueAccent, fontSize: 25.0),
              )
            ],
          ),
        ));
  }
}
