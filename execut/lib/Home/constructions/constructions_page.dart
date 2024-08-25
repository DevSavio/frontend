import 'package:execut/constants/size.dart';
import 'package:flutter/material.dart';
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
