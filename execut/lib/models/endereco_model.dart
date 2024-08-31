import 'dart:convert';

class Endereco {
  final int idEndereco;
  final String logradouro;
  final String complemento;
  final String cidade;
  final String estado;
  Endereco({
    required this.idEndereco,
    required this.logradouro,
    required this.complemento,
    required this.cidade,
    required this.estado,
  });

  Endereco copyWith({
    int? idEndereco,
    String? logradouro,
    String? complemento,
    String? cidade,
    String? estado,
  }) {
    return Endereco(
      idEndereco: idEndereco ?? this.idEndereco,
      logradouro: logradouro ?? this.logradouro,
      complemento: complemento ?? this.complemento,
      cidade: cidade ?? this.cidade,
      estado: estado ?? this.estado,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idEndereco': idEndereco,
      'logradouro': logradouro,
      'complemento': complemento,
      'cidade': cidade,
      'estado': estado,
    };
  }

  factory Endereco.fromMap(Map<String, dynamic> map) {
    return Endereco(
      idEndereco: map['idEndereco'].toInt() as int,
      logradouro: map['logradouro'] as String,
      complemento: map['complemento'] as String,
      cidade: map['cidade'] as String,
      estado: map['estado'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Endereco.fromJson(String source) =>
      Endereco.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Endereco(idEndereco: $idEndereco, logradouro: $logradouro, complemento: $complemento, cidade: $cidade, estado: $estado)';
  }

  @override
  bool operator ==(covariant Endereco other) {
    if (identical(this, other)) return true;

    return other.idEndereco == idEndereco &&
        other.logradouro == logradouro &&
        other.complemento == complemento &&
        other.cidade == cidade &&
        other.estado == estado;
  }

  @override
  int get hashCode {
    return idEndereco.hashCode ^
        logradouro.hashCode ^
        complemento.hashCode ^
        cidade.hashCode ^
        estado.hashCode;
  }
}
