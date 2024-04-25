import 'package:flutter/material.dart';
import 'package:imc/imc.dart';

class IMCResultado extends StatefulWidget {
  final IMC imc;
  const IMCResultado({super.key, required this.imc});

  @override
  // ignore: library_private_types_in_public_api
  _IMCResultadoState createState() => _IMCResultadoState();
}

class _IMCResultadoState extends State<IMCResultado> {
  late Color _corFaixa;

  @override
  void initState() {
    super.initState();
    switch (widget.imc.faixa) {
      case FaixaIMC.AbaixoIdeal:
        _corFaixa = Colors.green;
        break;
      case FaixaIMC.PesoIdeal:
        _corFaixa = Colors.blue;
        break;
      case FaixaIMC.AcimaIdeal:
        _corFaixa = Colors.orange;
        break;
      case FaixaIMC.ObesidadeI:
        _corFaixa = Colors.orangeAccent;
        break;
      case FaixaIMC.ObesidadeII:
        _corFaixa = Colors.red;
        break;
      case FaixaIMC.ObesidadeIII:
        _corFaixa = Colors.deepPurple;
        break;
      default:
        _corFaixa = Colors.grey;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado do IMC'),
        backgroundColor: _corFaixa,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: _corFaixa, width: 9),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    widget.imc.imc.toStringAsPrecision(3),
                    style: const TextStyle(fontSize: 90),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Classificação:',
                    style: TextStyle(fontSize: 16, color: _corFaixa),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    '${widget.imc.faixa?.descricao}',
                    style: TextStyle(fontSize: 20, color: _corFaixa),
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                        'O seu IMC indica se você possui o peso ideal, se '
                        'está acima ou abaixo do peso. Lembre-se que uma boa alimentação '
                        'e exercícios físicos regulares são fundamentais para '
                        'manter uma boa saúde. ')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
