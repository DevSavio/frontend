import 'dart:convert';

import 'cliente_model.dart';
import 'endereco_model.dart';
import 'pagamento_model.dart';
import 'prestador_model.dart';

class Obra {
  final int idObra;
  final int valorFinal;
  final String responsavelObra;
  final DateTime dataInicio;
  final DateTime dataFim;
  final Cliente cliente;
  final Pagamento pagamento;
  final Prestador prestador;
  final Endereco endereco;
  Obra({
    required this.idObra,
    required this.valorFinal,
    required this.responsavelObra,
    required this.dataInicio,
    required this.dataFim,
    required this.cliente,
    required this.pagamento,
    required this.prestador,
    required this.endereco,
  });

  Obra copyWith({
    int? idObra,
    int? valorFinal,
    String? responsavelObra,
    DateTime? dataInicio,
    DateTime? dataFim,
    Cliente? cliente,
    Pagamento? pagamento,
    Prestador? prestador,
    Endereco? endereco,
  }) {
    return Obra(
      idObra: idObra ?? this.idObra,
      valorFinal: valorFinal ?? this.valorFinal,
      responsavelObra: responsavelObra ?? this.responsavelObra,
      dataInicio: dataInicio ?? this.dataInicio,
      dataFim: dataFim ?? this.dataFim,
      cliente: cliente ?? this.cliente,
      pagamento: pagamento ?? this.pagamento,
      prestador: prestador ?? this.prestador,
      endereco: endereco ?? this.endereco,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idObra': idObra,
      'valorFinal': valorFinal,
      'responsavelObra': responsavelObra,
      'dataInicio': dataInicio.toIso8601String(),
      'dataFim': dataFim.toIso8601String(),
      'cliente': cliente.toMap(),
      'pagamento': pagamento.toMap(),
      'prestador': prestador.toMap(),
      'endereco': endereco.toMap(),
    };
  }

  factory Obra.fromMap(Map<String, dynamic> map) {
    return Obra(
      idObra: map['idObra'].toInt() as int,
      valorFinal: map['valorFinal'].toInt() as int,
      responsavelObra: map['responsavelObra'] as String,
      dataInicio: DateTime.parse(map['dataInicio'] as String),
      dataFim: DateTime.parse(map['dataFim'] as String),
      cliente: Cliente.fromMap(map['cliente'] as Map<String, dynamic>),
      pagamento: Pagamento.fromMap(map['pagamento'] as Map<String, dynamic>),
      prestador: Prestador.fromMap(map['prestador'] as Map<String, dynamic>),
      endereco: Endereco.fromMap(map['endereco'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Obra.fromJson(String source) =>
      Obra.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Obra(idObra: $idObra, valorFinal: $valorFinal, responsavelObra: $responsavelObra, dataInicio: $dataInicio, dataFim: $dataFim, cliente: $cliente, pagamento: $pagamento, prestador: $prestador, endereco: $endereco)';
  }

  @override
  bool operator ==(covariant Obra other) {
    if (identical(this, other)) return true;

    return other.idObra == idObra &&
        other.valorFinal == valorFinal &&
        other.responsavelObra == responsavelObra &&
        other.dataInicio == dataInicio &&
        other.dataFim == dataFim &&
        other.cliente == cliente &&
        other.pagamento == pagamento &&
        other.prestador == prestador &&
        other.endereco == endereco;
  }

  @override
  int get hashCode {
    return idObra.hashCode ^
        valorFinal.hashCode ^
        responsavelObra.hashCode ^
        dataInicio.hashCode ^
        dataFim.hashCode ^
        cliente.hashCode ^
        pagamento.hashCode ^
        prestador.hashCode ^
        endereco.hashCode;
  }
}
