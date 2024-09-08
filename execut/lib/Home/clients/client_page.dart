// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:execut/constants/size.dart';
import 'package:execut/models/cliente_model.dart';
import 'package:execut/models/endereco_model.dart';
import 'package:execut/widgets/modal_widget.dart';
import 'package:flutter/material.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  List<Cliente> listaClientes = [];

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
        // ErrorInterceptor(),
      ]);

      final response = await customDio.get('http://localhost:8080/clientes');

      response.data.forEach((item) {
        listaClientes.add(
          Cliente(
            idCliente: item["idCliente"],
            nomeCliente: item["nomeCliente"],
            razaoSocial: item["razaoSocial"],
            cpfCnpj: item["cpfCnpj"],
            telefone: item["telefone"],
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
        print("Até aqui o Senhor tem me acompanhado com os Clientes!");
        print(listaClientes.toList());
      });

      print(response);
    } catch (e) {
      print(e);
    }
  }

  List<Widget> buildItens() {
    List<Widget> list = [];
    for (int i = 0; i < listaClientes.length; i++) {
      list.add(
        _cardCliente(cliente: listaClientes[i]),
      );
    }
    return list;
  }

  Future<void> showMyDialog(context, {Cliente? cliente}) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ModalWidget(
              child: SizedBox(
            width: sizeH * 0.725,
            child: Column(
              children: [
                AlertDialog(
                  title: Text("CHAMANDO O DIALOGO DE CLIENTE"),
                ),
                Container(
                  width: 66,
                  height: 66,
                  decoration: const BoxDecoration(
                    // borderRadius: BorderRadius.all(),
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/66x66"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Linha 2: Campo de descrição
                cliente != null
                    ? Text(
                        cliente.nomeCliente,
                      )
                    : const SizedBox(
                        height: 0,
                      ),
                AlertDialog(
                  title:
                      Text('Chamado a CAIXA DE DIALOGO depois de adicionado'),
                )
              ],
            ),
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 250, 143, 143)),
        child: Column(
          children: [
            SizedBox(
              height: sizeH * 0.075,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'CLIENTE',
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
                      hintText: 'PROCURAR CLIENTE',
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
                    AlertDialog(
                      title: Text('CHAMANDO O NOVO'),
                    );
                  },
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
            )
          ],
        ),
      ),
    );
  }

  Widget _cardCliente({required Cliente cliente}) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          height: sizeH * 0.3875,
          width: sizeW * 0.2125,
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
                  "Nome do Cliente: ${cliente.nomeCliente}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Razão Social: ${cliente.razaoSocial}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Telefone: ${cliente.telefone}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Logradouro Cliente: ${cliente.endereco.logradouro}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Complemento Cliente: ${cliente.endereco.complemento}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Cidade Cliente: ${cliente.endereco.cidade}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Estado Cliente: ${cliente.endereco.estado}",
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
                showMyDialog(context, cliente: cliente);
              } else if (value == 'delete') {
                //TODO: Ação de excluir
                print("Excluir person id ${cliente.idCliente}");
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
