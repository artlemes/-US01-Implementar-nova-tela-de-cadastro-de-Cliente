import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'graphql_client.dart';


const _createUserMutation = r'''
mutation CreateUser($input: CreateUserInput!) {
  createUser(input: $input) {
    id
    name
    email
  }
}
''';

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
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _enderecoController.dispose();
    super.dispose();
  }

  bool _isLoading = false;

  void _showMessage(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  Future<void> _submit() async {
    
    if (!_formKey.currentState!.validate()) {
      return;
    };

    setState(() => _isLoading = true);

    final result = await graphQLClient.mutate(
      MutationOptions(
        document: gql(_createUserMutation),
        variables: {
          'input': {
            'name': _nameController.text,
            'email': _emailController.text,
            'password': _passwordController.text,
            'endereco': _enderecoController.text,
          },
        },
      ),
    );

    if (!mounted) return;
    setState(() => _isLoading = false);

    if (result.hasException) {
      final errors = result.exception?.graphqlErrors ?? [];
      _showMessage(
        errors.isNotEmpty
            ? errors.first.message
            : 'Não foi possível conectar ao servidor',
      );
      return;
    }

    _showMessage('Cadastro realizado com sucesso!');
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _enderecoController.clear();
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
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,


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
                          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, height: 1),
                          ),
                          Text(
                          'CONTA',
                          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, height: 1),
                          ),
                          SizedBox(height: 8),
                          SizedBox(
                          width: 45,
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
                                helperText: ' ',
                              ),
                              validator: (value) {
                                final name = value?.trim() ?? '';

                                if (name.isEmpty) {
                                  return 'Nome de usuário é obrigatório';
                                }

                                if (name.length > 100) {
                                  return 'Nome de usuário deve ter no máximo 100 caracteres';
                                }

                                return null;
                              },
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
                                helperText: ' ',
                              ),
                              validator: (value) {
                                final email = value?.trim() ?? '';

                                if (email.isEmpty ||
                                    !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                                        .hasMatch(email)) {
                                  return 'E-mail inválido';
                                }

                                if (email.length > 250) {
                                  return 'E-mail deve ter no máximo 250 caracteres';
                                }

                                return null;
                              },
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
                                helperText: ' ',
                              ),
                              validator: (value) {
                                final senha = value ?? '';

                                if (senha.length < 6) {
                                  return 'Senha deve ter pelo menos 6 caracteres';
                                }

                                if (senha.length > 50) {
                                  return 'Senha deve ter no máximo 50 caracteres';
                                }

                                return null;
                              },
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
                              maxLines: 3,
                              decoration: const InputDecoration(
                                hintText: 'Rua, Número, Complemento, Bairro',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(),
                                helperText: ' ',
                              ),
                              validator: (value) {
                                final endereco = value?.trim() ?? '';

                                if (endereco.isEmpty) {
                                  return 'Endereço é obrigatório';
                                }

                                if (endereco.length > 250) {
                                  return 'Endereço deve ter no máximo 250 caracteres';
                                }

                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
                    onPressed: _isLoading ? null : _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 48),
                      shape: const RoundedRectangleBorder(),
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text('FINALIZAR CADASTRO'),
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