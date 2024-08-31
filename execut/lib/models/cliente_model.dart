import 'dart:convert';

import 'endereco_model.dart';

class Cliente {
  final int idCliente;
  final String nomeCliente;
  final String razaoSocial;
  final String cpfCnpj;
  final String telefone;
  final Endereco endereco;
  Cliente({
    required this.idCliente,
    required this.nomeCliente,
    required this.razaoSocial,
    required this.cpfCnpj,
    required this.telefone,
    required this.endereco,
  });

  Cliente copyWith({
    int? idCliente,
    String? nomeCliente,
    String? razaoSocial,
    String? cpfCnpj,
    String? telefone,
    Endereco? endereco,
  }) {
    return Cliente(
      idCliente: idCliente ?? this.idCliente,
      nomeCliente: nomeCliente ?? this.nomeCliente,
      razaoSocial: razaoSocial ?? this.razaoSocial,
      cpfCnpj: cpfCnpj ?? this.cpfCnpj,
      telefone: telefone ?? this.telefone,
      endereco: endereco ?? this.endereco,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idCliente': idCliente,
      'nomeCliente': nomeCliente,
      'razaoSocial': razaoSocial,
      'cpfCnpj': cpfCnpj,
      'telefone': telefone,
      'endereco': endereco.toMap(),
    };
  }

  factory Cliente.fromMap(Map<String, dynamic> map) {
    return Cliente(
      idCliente: map['idCliente'].toInt() as int,
      nomeCliente: map['nomeCliente'] as String,
      razaoSocial: map['razaoSocial'] as String,
      cpfCnpj: map['cpfCnpj'] as String,
      telefone: map['telefone'] as String,
      endereco: Endereco.fromMap(map['endereco'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Cliente.fromJson(String source) =>
      Cliente.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Cliente(idCliente: $idCliente, nomeCliente: $nomeCliente, razaoSocial: $razaoSocial, cpfCnpj: $cpfCnpj, telefone: $telefone, endereco: $endereco)';
  }

  @override
  bool operator ==(covariant Cliente other) {
    if (identical(this, other)) return true;

    return other.idCliente == idCliente &&
        other.nomeCliente == nomeCliente &&
        other.razaoSocial == razaoSocial &&
        other.cpfCnpj == cpfCnpj &&
        other.telefone == telefone &&
        other.endereco == endereco;
  }

  @override
  int get hashCode {
    return idCliente.hashCode ^
        nomeCliente.hashCode ^
        razaoSocial.hashCode ^
        cpfCnpj.hashCode ^
        telefone.hashCode ^
        endereco.hashCode;
  }
}
