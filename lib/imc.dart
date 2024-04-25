enum FaixaIMC {
  // ignore: constant_identifier_names
  AbaixoIdeal,
  // ignore: constant_identifier_names
  PesoIdeal,
  // ignore: constant_identifier_names
  AcimaIdeal,
  // ignore: constant_identifier_names
  ObesidadeI,
  // ignore: constant_identifier_names
  ObesidadeII,
  // ignore: constant_identifier_names
  ObesidadeIII,
}

extension FaixaIMCExt on FaixaIMC {
  String? get descricao {
    switch (this) {
      case FaixaIMC.AbaixoIdeal:
        return 'Abaixo do Peso';
      case FaixaIMC.PesoIdeal:
        return 'Peso Ideal';
      case FaixaIMC.AcimaIdeal:
        return 'Acima do Peso';
      case FaixaIMC.ObesidadeI:
        return 'Obesidade Grau I';
      case FaixaIMC.ObesidadeII:
        return 'Obesidade Grau II';
      case FaixaIMC.ObesidadeIII:
        return 'Obesidade Grau III';
      default:
        return null;
    }
  }
}

class IMC {
  final double peso;
  final double altura;

  IMC({required this.peso, required this.altura});

  double get imc => peso / (altura * altura);

  FaixaIMC? get faixa {
    final valueIMC = imc;

    if (valueIMC < 18.6) return FaixaIMC.AbaixoIdeal;
    if (valueIMC < 24.9) return FaixaIMC.PesoIdeal;
    if (valueIMC < 29.9) return FaixaIMC.AcimaIdeal;
    if (valueIMC < 34.9) return FaixaIMC.ObesidadeI;
    if (valueIMC < 39.9) return FaixaIMC.ObesidadeII;
    if (valueIMC >= 40) return FaixaIMC.ObesidadeIII;

    return null;
  }
}
