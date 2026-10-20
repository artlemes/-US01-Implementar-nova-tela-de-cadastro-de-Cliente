import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _enderecoController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _enderecoController.dispose();
    super.dispose();
  }

  void _submit() {
    debugPrint('nome: ${_nameController.text}');
    debugPrint('email: ${_emailController.text}');
    debugPrint('senha: ${_passwordController.text}');
    debugPrint('endereço: ${_enderecoController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // ação do botão
          },
        ),
        titleSpacing: 8.0,
        title: const Text(
          'ECOSOL DIGITAL',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // ─── Campos (área rolável) ────────────────────
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 1,
                  children: [
                    // Texto inicial
                    // Texto inicial
                    const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(
                        'CRIAR',
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, height: 1),
                        ),
                        Text(
                        'CONTA',
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, height: 1),
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                        width: 50,
                        height: 7,
                        child: ColoredBox(color: Colors.black),
                        ),
                    ],
                    ),

                    // Nome
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'NOME DE USUÁRIO',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              hintText: 'Ex: usuario123',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Email
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'E - MAIL',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              hintText: 'nome@exemplo.com.br',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Senha
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'SENHA',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: '******',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Endereço
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'ENDEREÇO',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _enderecoController,
                            maxLines: 4,
                            decoration: const InputDecoration(
                              hintText: 'Rua, Número, Complemento, Bairro',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ─── Rodapé (fixo) ────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                border: Border(
                  top: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 48),
                      shape: const RoundedRectangleBorder(),
                    ),
                    child: const Text('FINALIZAR CADASTRO'),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'PASSO 01/01',
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                      Text(
                        'STATUS: PENDENTE',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}