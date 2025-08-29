//Fazer isso aq - Tela de Login usando as moléculas e o Atomos
import 'package:flutter/material.dart';
import 'package:meu_projeto_integrador/shared/widgets/molecules/app_card.dart';
import 'package:meu_projeto_integrador/shared/widgets/molecules/app_form_field.dart';
import 'package:meu_projeto_integrador/shared/widgets/atoms/app_button.dart';
import 'package:meu_projeto_integrador/shared/widgets/atoms/app_text.dart';
import 'package:meu_projeto_integrador/shared/constants/app_spacings.dart';

class LoginFormOrganism extends StatefulWidget {
  final VoidCallback onLoginSuccess;

  const LoginFormOrganism({super.key, required this.onLoginSuccess});

  @override
  State<LoginFormOrganism> createState() => _LoginFormOrganismState();
}

class _LoginFormOrganismState extends State<LoginFormOrganism> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  void _onLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);

      Future.delayed(const Duration(seconds: 2), () {
        setState(() => _isLoading = false);
        widget.onLoginSuccess();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacings.large),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AppText(
                "Bem-vindo",
                style: AppTextStyle.headlineMedium,
                textAlign: TextAlign.center,
                isBold: true,
              ),
              const SizedBox(height: AppSpacings.large),

              AppFormField(
                controller: _emailController,
                labelText: "E-mail",
                hintText: "Digite seu e-mail",
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Informe o e-mail";
                  }
                  if (!value.contains('@')) {
                    return "E-mail inválido";
                  }
                  return null;
                },
              ),

              AppFormField(
                controller: _passwordController,
                labelText: "Senha",
                hintText: "Digite sua senha",
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Informe a senha";
                  }
                  if (value.length < 6) {
                    return "Mínimo 6 caracteres";
                  }
                  return null;
                },
              ),

              const SizedBox(height: AppSpacings.large),

              AppButton(
                text: "Entrar",
                onPressed: _onLogin,
                isLoading: _isLoading,
                type: AppButtonType.primary,
                icon: Icons.login,
              ),
            ],
          ),
        ),
      ),
    );
  }
}