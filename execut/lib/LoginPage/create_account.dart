import 'package:execut/LoginPage/login_page.dart';
import 'package:execut/constants/size.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECECEF),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: sizeW * 0.48571,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0xFFB8B8B8), width: sizeW * 0.0002142),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: sizeW * 0.01714285, vertical: sizeH * 0.024),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'Crie uma Conta',
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
                        'Crie a conta para continuar',
                        style: TextStyle(
                          color: Color(0xFF202224),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: sizeH * 0.05),
                    const Text(
                      'Username',
                      style: TextStyle(
                        color: Color(0xFF202224),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: sizeH * 0.01),
                    _buildInputField('Username', false),
                    const SizedBox(height: sizeH * 0.03),
                    const Text(
                      'Email:',
                      style: TextStyle(
                        color: Color(0xFF202224),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: sizeH * 0.01),
                    _buildInputField('email@email.com', false),
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
                    _buildInputField('••••••••', true),
                    const SizedBox(height: sizeH * 0.01),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Esqueceu a Senha?',
                        style: TextStyle(
                          color: Color(0xFF202224),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
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
                          'Eu aceito os termos e condições de uso',
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
                            'CADASTRAR',
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
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Já tem uma conta?  ',
                            style: TextStyle(
                              color: Color(0xFF202224),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => const LoginPage(),
                            child: const Text(
                              'Logue',
                              style: TextStyle(
                                color: Color(0xFF5A8CFF),
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
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

  Widget _buildInputField(String hintText, bool isPassword) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF1F4F9),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFD7D7D7), width: sizeW * 0.00071428),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: sizeW * 0.011428, vertical: sizeH * 0.012),
        child: Text(
          hintText,
          style: const TextStyle(
            color: Color(0xFFA6A6A6),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
