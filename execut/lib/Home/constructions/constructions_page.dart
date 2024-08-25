import 'package:dio/dio.dart';
import 'package:execut/Home/principal.dart';
import 'package:execut/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../widgets/modal_widget.dart';

class Person {
  final int id;
  final String nome;
  final String funcao;
  final IconData icon;
  final String telefone;

  Person({
    required this.id,
    required this.nome,
    required this.funcao,
    required this.icon,
    required this.telefone,
  });
}

class ConstructionsPage extends StatefulWidget {
  const ConstructionsPage({super.key});

  @override
  State<ConstructionsPage> createState() => _ConstructionsPageState();
}

class _ConstructionsPageState extends State<ConstructionsPage> {
  List<dynamic> listaobras = [];

  @override
  void initState() {
    super.initState();
    getInDatabase();
  }

  void getInDatabase() async {
    try {
      Dio customDio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 3000),
          receiveTimeout: const Duration(seconds: 3000),
          contentType: Headers.jsonContentType,
          validateStatus: (int? status) {
            return status != null;
            // return status != null && status >= 200 && status < 300;
          },
        ),
      );

      customDio.interceptors.addAll([
        ErrorInterceptor(),
      ]);

      final response = await customDio.get('http://localhost:8080/obras');

      response.data.forEach((item) {
        listaobras.add({
          "responsavelObra": item['responsavelObra'],
          "valorFinal": item['valorFinal'],
        });
      });

      setState(() {
        print("zzaa");
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
        _cardPerson(
          person: Person(
            id: i,
            nome: listaobras[i]['responsavelObra'],
            funcao: listaobras[i]['valorFinal'].toString(),
            icon: Icons.person,
            telefone: "contato pessoal",
          ),
        ),
      );
    }
    return list;
  }

  Future<void> showMyDialog(context, {Person? person}) async {
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
                // Linha 2: Campo de descrição
                person != null
                    ? Text(
                        person.nome,
                      )
                    : SizedBox(
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
        // AlertDialog(
        //   title: const Text('AlertDialog Title'),
        //   content: const SingleChildScrollView(
        //     child: ListBody(
        //       children: <Widget>[
        //         Text('This is a demo alert dialog.'),
        //         Text('Would you like to approve of this message?'),
        //       ],
        //     ),
        //   ),
        //   actions: <Widget>[
        //     TextButton(
        //       child: const Text('Approve'),
        //       onPressed: () {
        //         Navigator.of(context).pop();
        //       },
        //     ),
        //   ],
        // );
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
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
                      prefixIcon: Icon(Icons.search),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardPerson({
    required Person person,
  }) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(5),
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
                        color: Color.fromARGB(255, 201, 198, 198),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        Icons.person,
                        color: const Color(0xFF000000),
                        size: 38,
                      ),
                    ),
                  ],
                ),
                Text(
                  person.nome,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  person.funcao,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  person.telefone,
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
                showMyDialog(context, person: person);
              } else if (value == 'delete') {
                //TODO: Ação de excluir
                print("Excluir person id ${person.id}");
              }
            },
            itemBuilder: (BuildContext context) {
              return [
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
          //  Icon(
          //   Icons.edit_square,
          //   color: Colors.black,
          //   size: 20.0,
          // ),
        ),
      ],
    );
  }
}
