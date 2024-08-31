import 'dart:convert';

class Pagamento {
  final int idPagamento;
  final String tipoPagamento;
  final String moeda;
  Pagamento({
    required this.idPagamento,
    required this.tipoPagamento,
    required this.moeda,
  });

  Pagamento copyWith({
    int? idPagamento,
    String? tipoPagamento,
    String? moeda,
  }) {
    return Pagamento(
      idPagamento: idPagamento ?? this.idPagamento,
      tipoPagamento: tipoPagamento ?? this.tipoPagamento,
      moeda: moeda ?? this.moeda,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idPagamento': idPagamento,
      'tipoPagamento': tipoPagamento,
      'moeda': moeda,
    };
  }

  factory Pagamento.fromMap(Map<String, dynamic> map) {
    return Pagamento(
      idPagamento: map['idPagamento'].toInt() as int,
      tipoPagamento: map['tipoPagamento'] as String,
      moeda: map['moeda'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pagamento.fromJson(String source) =>
      Pagamento.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Pagamento(idPagamento: $idPagamento, tipoPagamento: $tipoPagamento, moeda: $moeda)';

  @override
  bool operator ==(covariant Pagamento other) {
    if (identical(this, other)) return true;

    return other.idPagamento == idPagamento &&
        other.tipoPagamento == tipoPagamento &&
        other.moeda == moeda;
  }

  @override
  int get hashCode =>
      idPagamento.hashCode ^ tipoPagamento.hashCode ^ moeda.hashCode;
}
