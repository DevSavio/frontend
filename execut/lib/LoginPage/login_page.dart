import 'package:execut/constants/size.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECECEF),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: sizeW * 0.0114285, vertical: sizeH * 0.016),
            child: Container(
              width: sizeW * 0.51,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0xFFB8B8B8), width: 0.3),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: sizeW * 0.046, vertical: sizeH * 0.07),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'Logar na Conta',
                        style: TextStyle(
                          color: Color(0xFF202224),
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: sizeH * 0.01),
                    const Center(
                      child: Text(
                        'Por favor entre com o seu email e senha',
                        style: TextStyle(
                          color: Color(0xFF202224),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: sizeH * 0.05),
                    const Text(
                      'Email:',
                      style: TextStyle(
                        color: Color(0xFF202224),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: sizeH * 0.01),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F4F9),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color(0xFFD7D7D7), width: sizeW * 0.0071428),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: sizeW * 0.0114285, vertical: sizeH * 0.016),
                        child: Text(
                          'execut@execut.com',
                          style: TextStyle(
                            color: Color(0xFFA6A6A6),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: sizeH * 0.03),
                    const Text(
                      'Senha',
                      style: TextStyle(
                        color: Color(0xFF202224),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: sizeH * 0.01),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F4F9),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color(0xFFD7D7D7), width: sizeW * 0.00071428),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: sizeW * 0.0114285, vertical: sizeH * 0.016),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '••••••••',
                              style: TextStyle(
                                color: Color(0xFFA6A6A6),
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Esqueceu a Senha?',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: sizeH * 0.02),
                    Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: (bool? value) {},
                        ),
                        const Text(
                          'Lembrar Senha',
                          style: TextStyle(
                            color: Color(0xFF202224),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: sizeH * 0.03),
                    Center(
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4880FF),
                            padding: const EdgeInsets.symmetric(vertical: sizeH * 0.02),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'LOGAR',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: sizeH * 0.02),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Não tem uma conta?',
                          style: TextStyle(
                            color: Color(0xFF202224),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: sizeW * 0.00714285),
                        Text(
                          'Crie sua Conta',
                          style: TextStyle(
                            color: Color(0xFF5A8CFF),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
