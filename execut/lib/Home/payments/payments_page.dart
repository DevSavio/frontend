import 'package:execut/constants/size.dart';
import 'package:flutter/material.dart';

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 250, 143, 143)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: sizeW * 1.0,
              padding: const EdgeInsets.all(5.0),
              child: const Center(
                child: Text("Pagamentos em construção", 
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                ),
              ),
              )
            )
          ]
        )
      )
    );
  }
}
