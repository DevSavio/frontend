import 'dart:convert';

class Funcao {
  final int idFuncao;
  final String nomeFuncao;
  final String descricaoFuncao;
  Funcao({
    required this.idFuncao,
    required this.nomeFuncao,
    required this.descricaoFuncao,
  });

  Funcao copyWith({
    int? idFuncao,
    String? nomeFuncao,
    String? descricaoFuncao,
  }) {
    return Funcao(
      idFuncao: idFuncao ?? this.idFuncao,
      nomeFuncao: nomeFuncao ?? this.nomeFuncao,
      descricaoFuncao: descricaoFuncao ?? this.descricaoFuncao,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idFuncao': idFuncao,
      'nomeFuncao': nomeFuncao,
      'descricaoFuncao': descricaoFuncao,
    };
  }

  factory Funcao.fromMap(Map<String, dynamic> map) {
    return Funcao(
      idFuncao: map['idFuncao'].toInt() as int,
      nomeFuncao: map['nomeFuncao'] as String,
      descricaoFuncao: map['descricaoFuncao'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Funcao.fromJson(String source) =>
      Funcao.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Funcao(idFuncao: $idFuncao, nomeFuncao: $nomeFuncao, descricaoFuncao: $descricaoFuncao)';

  @override
  bool operator ==(covariant Funcao other) {
    if (identical(this, other)) return true;

    return other.idFuncao == idFuncao &&
        other.nomeFuncao == nomeFuncao &&
        other.descricaoFuncao == descricaoFuncao;
  }

  @override
  int get hashCode =>
      idFuncao.hashCode ^ nomeFuncao.hashCode ^ descricaoFuncao.hashCode;
}
