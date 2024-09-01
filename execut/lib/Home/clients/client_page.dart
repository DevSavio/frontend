// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:execut/Home/principal.dart';
import 'package:execut/constants/size.dart';
import 'package:execut/widgets/modal_widget.dart';
import 'package:flutter/material.dart';

class Cliente {
  int? idCliente;
  String? nomeCliente;
  String? razaoSocial;
  String? cpfCnpj;
  String? telefone;
  Endereco? endereco;

  Cliente(Set<dynamic> set,
      {this.idCliente,
      this.nomeCliente,
      this.razaoSocial,
      this.cpfCnpj,
      this.telefone,
      this.endereco});

  Cliente.fromJson(Map<String, dynamic> json) {
    idCliente = json['idCliente'];
    nomeCliente = json['nomeCliente'];
    razaoSocial = json['razaoSocial'];
    cpfCnpj = json['cpfCnpj'];
    telefone = json['telefone'];
    endereco =
        json['endereco'] != null ? Endereco.fromJson(json['endereco']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['idCliente'] = idCliente;
    data['nomeCliente'] = nomeCliente;
    data['razaoSocial'] = razaoSocial;
    data['cpfCnpj'] = cpfCnpj;
    data['telefone'] = telefone;
    if (endereco != null) {
      data['endereco'] = endereco!.toJson();
    }
    return data;
  }
}

class Endereco {
  int? idEndereco;
  String? logradouro;
  String? complemento;
  String? cidade;
  String? estado;

  Endereco(
      {this.idEndereco,
      this.logradouro,
      this.complemento,
      this.cidade,
      this.estado});

  Endereco.fromJson(Map<String, dynamic> json) {
    idEndereco = json['idEndereco'];
    logradouro = json['logradouro'];
    complemento = json['complemento'];
    cidade = json['cidade'];
    estado = json['estado'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['idEndereco'] = idEndereco;
    data['logradouro'] = logradouro;
    data['complemento'] = complemento;
    data['cidade'] = cidade;
    data['estado'] = estado;
    return data;
  }
}

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  List<dynamic> cliAdd = [];

  @override
  void initState() {
    super.initState();
    getInDatabase();
  }

  void getInDatabase() async {
    try {
      Dio customDio = Dio(
        BaseOptions(
          // connectTimeout: const Duration(seconds: 1000),
          // receiveTimeout: const Duration(seconds: 1000),
          contentType: Headers.jsonContentType,
          validateStatus: (int? status) {
            return status != null;
          },
        ),
      );

      customDio.interceptors.addAll([
        ErrorInterceptor(),
      ]);

      final response = await customDio.get('http://localhost:8080/cliente');

      response.data.forEach((item) {
        cliAdd.add({
          "nomeCliente": item['nomeCliente'],
          "razaoSocial": item['razaoSocial'],
          "cpfCnpj": item['cpfCnpj'],
          "telefone": item['telefone'],
          "logradouro": item['logradouro'],
          "complemento": item['complemento'],
          "cidade": item['cidade'],
          "estado": item['estado']
        });
      });

      setState(() {
        print("Até aqui o Senhor tem me acompanhado");
        print(cliAdd);
      });

      print(response);
    } catch (e) {
      print(e);
    }
  }

  List<Widget> buildItens() {
    List<Widget> list = [];
    for (int i = 0; i < cliAdd.length; i++) {
      // list.add(
      //   _cardCliente(
      //       "teste": "teste"
      //   ),
      // );
      print(list[i]);
      _Cliente();
      print(i);
    }
    return list;
  }

  Future<void> showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return ModalWidget(
          child: SizedBox(
            width: 600,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Linha 1: Imagem
                Container(
                  width: 66,
                  height: 66,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/66x66"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // cli != null
                //     ?
                Text(
                  "cli.nomeCliente!",
                ),
                SizedBox(
                  height: 0,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Descrição',
                    hintText: 'Descrição do que será feito na obra',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  maxLines: 3,
                ),
                SizedBox(height: 16),
                // Linha 3: Seletor de tipo de mão de obra e seletor de prestador
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Tipo de Mão de Obra',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        items: [
                          DropdownMenuItem(
                            value: 'Tipo 1',
                            child: Text('Tipo 1'),
                          ),
                          DropdownMenuItem(
                            value: 'Tipo 2',
                            child: Text('Tipo 2'),
                          ),
                        ],
                        onChanged: (value) {},
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Prestador',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        items: [
                          DropdownMenuItem(
                            value: 'Prestador 1',
                            child: Text('Prestador 1'),
                          ),
                          DropdownMenuItem(
                            value: 'Prestador 2',
                            child: Text('Prestador 2'),
                          ),
                        ],
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                // Linha 4: Seletor de função
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Função',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  items: [
                    DropdownMenuItem(
                      value: 'Função 1',
                      child: Text('Função 1'),
                    ),
                    DropdownMenuItem(
                      value: 'Função 2',
                      child: Text('Função 2'),
                    ),
                  ],
                  onChanged: (value) {},
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 250, 143, 143)),
            child: Column(children: [
              Expanded(
                  child: SingleChildScrollView(
                      child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: sizeH * 0.075,
                                ),
                                const Text(
                                  'CLIENTE',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Color(0xFF202224),
                                    fontSize: 36,
                                    fontFamily: 'Nunito Sans',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: sizeH * 0.05,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: sizeW * 0.3525,
                                      height: sizeH * 0.07,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: sizeW * 0.01875),
                                            child: Icon(Icons.search),
                                          ),
                                          Text(
                                            "Procurar",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                          GestureDetector(
                            onTap: () => _Cliente(),
                            child: Container(
                                      alignment: Alignment.center,
                                      width: sizeW * 0.1375,
                                      height: sizeH * 0.075,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color.fromARGB(255, 17, 1, 192),
                                      ),
                                      child: Text(
                                        "ADICIONAR NOVO",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Wrap(
                                    alignment: WrapAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Container(
                                          color: Colors.brown,
                                        ),
                                        // _cardCliente(
                                        //     idCliente: cli[]('idCliente'),
                                        //     nomeCliente: c[]('nomeCliente'),
                                        //     razaoSocial: c[]('razaoSocial'),
                                        //     cpfCnpj: c[]('cpfCnpj'),
                                        //     telefone: c[]('telefone'),
                                      )
                                    ])
                              ]))))
            ])));
  }

  Widget _Cliente() {
    return Container(
      height: sizeH * 0.235,
      width: sizeW * 0.2025,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 54,
            offset: Offset(6, 6),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //   padding: const EdgeInsets.all(15),
                //   decoration: BoxDecoration(
                //     color: Color.fromARGB(255, 201, 198, 198),
                //     borderRadius: BorderRadius.circular(100),
                //   ),
                //   child: Icon(
                //     icon,
                //     color: const Color(0xFF000000),
                //     size: 38,
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child:
                      Icon(Icons.edit_square, color: Colors.black, size: 20.0),
                ),
              ],
            ),
            Text(
              "nomeCliente",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "razaoSocial",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "cpfCnpj",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "telefone",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Endereço.logradouro",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "Endereço.complemento",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
