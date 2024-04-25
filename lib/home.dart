import 'package:flutter/material.dart';
import 'package:imc/imc.dart';
import 'package:imc/resultado.dart';

class HomeIMC extends StatefulWidget {
  const HomeIMC({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeIMCState createState() => _HomeIMCState();
}

class _HomeIMCState extends State<HomeIMC> {
  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();

  void _limparCampos() {
    _alturaController.text = "";
    _pesoController.text = "";
  }

  void _btnCalcularIMC() {
    double alt = double.tryParse(_alturaController.text) ?? 0;
    double pes = double.tryParse(_pesoController.text) ?? 0;

    var myImc = IMC(altura: alt, peso: pes);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => IMCResultado(imc: myImc),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC Calculator '),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _limparCampos,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Icon(
                  Icons.calculate_outlined,
                  color: Colors.blue,
                  size: 80.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _alturaController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Altura'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _pesoController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Peso'),
                ),
              ),
              ElevatedButton(
                onPressed: _btnCalcularIMC,
                child: const Text('Calcular IMC'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
