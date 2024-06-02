// ignore_for_file: prefer_const_constructors

import 'package:execut/constants/size.dart';
import 'package:flutter/material.dart';

class LaborPage extends StatelessWidget {
  const LaborPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 250, 143, 143)),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: sizeH * 0.05,
                      ),
                      const Text(
                        'MÃO DE OBRA',
                        textAlign: TextAlign.start,
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                        width: sizeW * 0.3525,
                        height: sizeH * 0.07,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
                        color: const Color.fromARGB(255, 224, 221, 221),),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: sizeW * 0.01875),
                              child: Icon(Icons.search),
                            ),
                            Text("Procurar", style: TextStyle(
                              color: Colors.black,
                            ),)
                          ],)
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: sizeW * 0.1375,
                        height: sizeH * 0.075,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                        color: Color.fromARGB(255, 17, 1, 192),),
                        child:Text("ADICIONAR NOVO",
                        textAlign: TextAlign.center, 
                        style: TextStyle(
                        color: Colors.white,
                        ),
                                                  )
                      ),
                        ],
                      ),
                      Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: _cardPerson(
                              nome: 'Nome da Pessoa',
                              funcao: 'função a ser desempenhada',
                              icon: Icons.person,
                              telefone: "contato pessoal",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: _cardPerson(
                              nome: 'Nome da Pessoa',
                              funcao: 'função a ser desempenhada',
                              icon: Icons.person,
                              telefone: "contato pessoal",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: _cardPerson(
                              nome: 'Nome da Pessoa',
                              funcao: 'função a ser desempenhada',
                              icon: Icons.person,
                              telefone: "contato pessoal",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: _cardPerson(
                              nome: 'Nome da Pessoa',
                              funcao: 'função a ser desempenhada',
                              icon: Icons.person,
                              telefone: "contato pessoal",
                            ),
                          ),
                        ],
                      ),
                      Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: _cardPerson(
                              nome: 'Nome da Pessoa',
                              funcao: 'função a ser desempenhada',
                              icon: Icons.person,
                              telefone: "contato pessoal",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: _cardPerson(
                              nome: 'Nome da Pessoa',
                              funcao: 'função a ser desempenhada',
                              icon: Icons.person,
                              telefone: "contato pessoal",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: _cardPerson(
                              nome: 'Nome da Pessoa',
                              funcao: 'função a ser desempenhada',
                              icon: Icons.person,
                              telefone: "contato pessoal",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: _cardPerson(
                              nome: 'Nome da Pessoa',
                              funcao: 'função a ser desempenhada',
                              icon: Icons.person,
                              telefone: "contato pessoal",
                            ),
                          ),
                        ],
                      ),
                      Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: _cardPerson(
                              nome: 'Nome da Pessoa',
                              funcao: 'função a ser desempenhada',
                              icon: Icons.person,
                              telefone: "contato pessoal",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: _cardPerson(
                              nome: 'Nome da Pessoa',
                              funcao: 'função a ser desempenhada',
                              icon: Icons.person,
                              telefone: "contato pessoal",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: _cardPerson(
                              nome: 'Nome da Pessoa',
                              funcao: 'função a ser desempenhada',
                              icon: Icons.person,
                              telefone: "contato pessoal",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: _cardPerson(
                              nome: 'Nome da Pessoa',
                              funcao: 'função a ser desempenhada',
                              icon: Icons.person,
                              telefone: "contato pessoal",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]
        )
      )
    );
  }


    Widget _cardPerson({
    required String nome,
    required String funcao,
    required IconData icon,
    required String telefone,
  }) {
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
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 201, 198, 198),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(
                    icon,
                    color: const Color(0xFF000000),
                    size: 38,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Icon(Icons.edit_square, color: Colors.black, size: 20.0),
                ),
              ],
            ),
            Text(
              nome,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              funcao,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              telefone,
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
