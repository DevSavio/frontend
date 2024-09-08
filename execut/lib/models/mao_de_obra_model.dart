class MaoDeObra {
  int? idMao;
  String? maoDescricao;
  Tipo? tipo;
  Prestador? prestador;
  Funcao? funcao;

  MaoDeObra(
      {this.idMao, this.maoDescricao, this.tipo, this.prestador, this.funcao});

  MaoDeObra.fromJson(Map<String, dynamic> json) {
    idMao = json['idMao'];
    maoDescricao = json['maoDescricao'];
    tipo = json['tipo'] != null ? Tipo.fromJson(json['tipo']) : null;
    prestador = json['prestador'] != null
        ? Prestador.fromJson(json['prestador'])
        : null;
    funcao = json['funcao'] != null ? Funcao.fromJson(json['funcao']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idMao'] = idMao;
    data['maoDescricao'] = maoDescricao;
    if (tipo != null) {
      data['tipo'] = tipo!.toJson();
    }
    if (prestador != null) {
      data['prestador'] = prestador!.toJson();
    }
    if (funcao != null) {
      data['funcao'] = funcao!.toJson();
    }
    return data;
  }
}

class Tipo {
  int? idTipo;
  String? nomeTipo;
  String? tipoMaoDescricao;

  Tipo({this.idTipo, this.nomeTipo, this.tipoMaoDescricao});

  Tipo.fromJson(Map<String, dynamic> json) {
    idTipo = json['idTipo'];
    nomeTipo = json['nomeTipo'];
    tipoMaoDescricao = json['tipoMaoDescricao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idTipo'] = idTipo;
    data['nomeTipo'] = nomeTipo;
    data['tipoMaoDescricao'] = tipoMaoDescricao;
    return data;
  }
}

class Prestador {
  int? idPrestador;
  String? nomePrestador;
  String? tipoPrestador;
  String? cpfCnpj;
  String? telefone;
  Funcao? funcao;

  Prestador(
      {this.idPrestador,
      this.nomePrestador,
      this.tipoPrestador,
      this.cpfCnpj,
      this.telefone,
      this.funcao});

  Prestador.fromJson(Map<String, dynamic> json) {
    idPrestador = json['idPrestador'];
    nomePrestador = json['nomePrestador'];
    tipoPrestador = json['tipoPrestador'];
    cpfCnpj = json['cpfCnpj'];
    telefone = json['telefone'];
    funcao = json['funcao'] != null ? Funcao.fromJson(json['funcao']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idPrestador'] = idPrestador;
    data['nomePrestador'] = nomePrestador;
    data['tipoPrestador'] = tipoPrestador;
    data['cpfCnpj'] = cpfCnpj;
    data['telefone'] = telefone;
    if (funcao != null) {
      data['funcao'] = funcao!.toJson();
    }
    return data;
  }
}

class Funcao {
  int? idFuncao;
  String? nomeFuncao;
  String? descricaoFuncao;

  Funcao({this.idFuncao, this.nomeFuncao, this.descricaoFuncao});

  Funcao.fromJson(Map<String, dynamic> json) {
    idFuncao = json['idFuncao'];
    nomeFuncao = json['nomeFuncao'];
    descricaoFuncao = json['descricaoFuncao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idFuncao'] = idFuncao;
    data['nomeFuncao'] = nomeFuncao;
    data['descricaoFuncao'] = descricaoFuncao;
    return data;
  }
}
