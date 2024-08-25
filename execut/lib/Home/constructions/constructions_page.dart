import 'package:execut/constants/size.dart';
import 'package:flutter/material.dart';

class ConstructionsPage extends StatefulWidget {
  const ConstructionsPage({super.key});

  @override
  State<ConstructionsPage> createState() => _ConstructionsPageState();
}

class _ConstructionsPageState extends State<ConstructionsPage> {
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
                child: Text("Obras em construção", 
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
