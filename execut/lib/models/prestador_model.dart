import 'dart:convert';

import 'funcao_model.dart';

class Prestador {
  final int idPrestador;
  final String nomePrestador;
  final String tipoPrestador;
  final String cpfCnpj;
  final String telefone;
  final Funcao funcao;
  Prestador({
    required this.idPrestador,
    required this.nomePrestador,
    required this.tipoPrestador,
    required this.cpfCnpj,
    required this.telefone,
    required this.funcao,
  });

  Prestador copyWith({
    int? idPrestador,
    String? nomePrestador,
    String? tipoPrestador,
    String? cpfCnpj,
    String? telefone,
    Funcao? funcao,
  }) {
    return Prestador(
      idPrestador: idPrestador ?? this.idPrestador,
      nomePrestador: nomePrestador ?? this.nomePrestador,
      tipoPrestador: tipoPrestador ?? this.tipoPrestador,
      cpfCnpj: cpfCnpj ?? this.cpfCnpj,
      telefone: telefone ?? this.telefone,
      funcao: funcao ?? this.funcao,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idPrestador': idPrestador,
      'nomePrestador': nomePrestador,
      'tipoPrestador': tipoPrestador,
      'cpfCnpj': cpfCnpj,
      'telefone': telefone,
      'funcao': funcao.toMap(),
    };
  }

  factory Prestador.fromMap(Map<String, dynamic> map) {
    return Prestador(
      idPrestador: map['idPrestador'].toInt() as int,
      nomePrestador: map['nomePrestador'] as String,
      tipoPrestador: map['tipoPrestador'] as String,
      cpfCnpj: map['cpfCnpj'] as String,
      telefone: map['telefone'] as String,
      funcao: Funcao.fromMap(map['funcao'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Prestador.fromJson(String source) =>
      Prestador.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Prestador(idPrestador: $idPrestador, nomePrestador: $nomePrestador, tipoPrestador: $tipoPrestador, cpfCnpj: $cpfCnpj, telefone: $telefone, funcao: $funcao)';
  }

  @override
  bool operator ==(covariant Prestador other) {
    if (identical(this, other)) return true;

    return other.idPrestador == idPrestador &&
        other.nomePrestador == nomePrestador &&
        other.tipoPrestador == tipoPrestador &&
        other.cpfCnpj == cpfCnpj &&
        other.telefone == telefone &&
        other.funcao == funcao;
  }

  @override
  int get hashCode {
    return idPrestador.hashCode ^
        nomePrestador.hashCode ^
        tipoPrestador.hashCode ^
        cpfCnpj.hashCode ^
        telefone.hashCode ^
        funcao.hashCode;
  }
}
