import 'package:dio/dio.dart';
import 'package:execut/Home/principal.dart';
import 'package:execut/constants/size.dart';
import 'package:execut/models/cliente_model.dart';
import 'package:execut/models/funcao_model.dart';
import 'package:execut/models/obra_model.dart';
import 'package:execut/models/pagamento_model.dart';
import 'package:execut/models/prestador_model.dart';
import 'package:flutter/material.dart';

import '../../models/endereco_model.dart';
import '../../widgets/modal_widget.dart';

class ConstructionsPage extends StatefulWidget {
  const ConstructionsPage({super.key});

  @override
  State<ConstructionsPage> createState() => _ConstructionsPageState();
}

class _ConstructionsPageState extends State<ConstructionsPage> {
  List<Obra> listaobras = [];

  @override
  void initState() {
    super.initState();
    getInDatabase();
  }

  void getInDatabase() async {
    try {
      Dio customDio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 5000),
          receiveTimeout: const Duration(seconds: 5000),
          contentType: Headers.jsonContentType,
          validateStatus: (int? status) {
            return status != null;
          },
        ),
      );

      customDio.interceptors.addAll([
        ErrorInterceptor(),
      ]);

      final response = await customDio.get('http://localhost:8080/obras');

      response.data.forEach((item) {
        listaobras.add(
          Obra(
            idObra: item["idObra"],
            valorFinal: item["valorFinal"],
            dataInicio: DateTime.parse(item["dataInicio"]),
            dataFim: DateTime.parse(item["dataFim"]),
            responsavelObra: item["responsavelObra"],
            cliente: Cliente(
              idCliente: item["cliente"]["idCliente"],
              nomeCliente: item["cliente"]["nomeCliente"],
              razaoSocial: item["cliente"]["razaoSocial"],
              cpfCnpj: item["cliente"]["cpfCnpj"],
              telefone: item["cliente"]["telefone"],
              endereco: Endereco(
                idEndereco: item["cliente"]["endereco"]["idEndereco"],
                logradouro: item["cliente"]["endereco"]["logradouro"],
                complemento: item["cliente"]["endereco"]["complemento"],
                cidade: item["cliente"]["endereco"]["cidade"],
                estado: item["cliente"]["endereco"]["estado"],
              ),
            ),
            pagamento: Pagamento(
              idPagamento: item["pagamento"]["idPagamento"],
              tipoPagamento: item["pagamento"]["tipoPagamento"],
              moeda: item["pagamento"]["moeda"],
            ),
            prestador: Prestador(
              idPrestador: item["prestador"]["idPrestador"],
              nomePrestador: item["prestador"]["nomePrestador"],
              tipoPrestador: item["prestador"]["tipoPrestador"],
              cpfCnpj: item["prestador"]["cpfCnpj"],
              telefone: item["prestador"]["telefone"],
              funcao: Funcao(
                idFuncao: item["prestador"]["funcao"]['idFuncao'],
                nomeFuncao: item["prestador"]["funcao"]['nomeFuncao'],
                descricaoFuncao: item["prestador"]["funcao"]['descricaoFuncao'],
              ),
            ),
            endereco: Endereco(
              idEndereco: item["endereco"]["idEndereco"],
              logradouro: item["endereco"]["logradouro"],
              complemento: item["endereco"]["complemento"],
              cidade: item["endereco"]["cidade"],
              estado: item["endereco"]["estado"],
            ),
          ),
        );
      });

      setState(() {
        print("Até aqui o Senhor tem me acompanhado");
        print(listaobras.toList());
      });

      print(response);
    } catch (e) {
      print(e);
    }
  }

  List<Widget> buildItens() {
    List<Widget> list = [];
    for (int i = 0; i < listaobras.length; i++) {
      list.add(
        _card(obra: listaobras[i]),
      );
    }
    return list;
  }

  Future<void> showMyDialog(context, {Obra? obra}) async {
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
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/66x66"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Linha 2: Campo de descrição
                obra != null
                    ? Text(
                        obra.responsavelObra.toString(),
                      )
                    : const SizedBox(
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
                const SizedBox(height: 16),
                // Linha 3: Seletor de tipo de mão de obra e seletor de prestador
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Obra',
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
                    const SizedBox(width: 16),
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
                const SizedBox(height: 16),
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
                const SizedBox(height: 50),
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
        padding: const EdgeInsets.all(20.0),
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 250, 143, 143)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: sizeH * 0.01,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'OBRA',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color(0xFF202224),
                    fontSize: 36,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 500,
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'PROCURAR',
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: const EdgeInsets.all(8.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getInDatabase();
                    //showMyDialog(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: sizeW * 0.1375,
                    height: sizeH * 0.075,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 17, 1, 192),
                    ),
                    child: const Text(
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
            const SizedBox(
              height: sizeH * 0.05,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Wrap(
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      verticalDirection: VerticalDirection.down,
                      spacing: 10,
                      direction: Axis.horizontal,
                      children: buildItens(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _card({required Obra obra}) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          height: 235,
          width: 290,
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
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 201, 198, 198),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Color(0xFF000000),
                        size: 38,
                      ),
                    ),
                  ],
                ),
                Text(
                  obra.responsavelObra.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  obra.valorFinal.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  obra.dataInicio.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  obra.dataFim.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  obra.cliente.nomeCliente.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  obra.cliente.telefone.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  obra.cliente.endereco.logradouro.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  obra.cliente.endereco.complemento.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  obra.endereco.cidade.toString(),
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
        ),
        Positioned(
          top: 25,
          right: 25,
          child: PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'edit') {
                //TODO:  Ação de editar
                showMyDialog(context, obra: obra);
              } else if (value == 'delete') {
                //TODO: Ação de excluir
                print("Excluir person id ${obra.idObra}");
              }
            },
            itemBuilder: (BuildContext context) {
              return const [
                PopupMenuItem(
                  value: 'edit',
                  child: Text('Editar'),
                ),
                PopupMenuItem(
                  value: 'delete',
                  child: Text('Excluir'),
                ),
              ];
            },
          ),
        ),
      ],
    );
  }
}
