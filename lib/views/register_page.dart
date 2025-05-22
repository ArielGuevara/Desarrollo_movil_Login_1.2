import 'package:flutter/material.dart';
import 'package:pry_login_uno/views/login_page.dart';
import 'package:pry_login_uno/controllers/login_controller.dart';


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _usuarioController = TextEditingController();
  final _claveController = TextEditingController();
  final _confirmClaveController = TextEditingController();

  @override
  void dispose() {
    _usuarioController.dispose();
    _claveController.dispose();
    _confirmClaveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _usuarioController,
                decoration: InputDecoration(labelText: 'Usuario'),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Requerido';
                  if (value.length < 3) return 'Mínimo 3 caracteres';
                  return null;
                },
              ),
              TextFormField(
                controller: _claveController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Contraseña'),
                validator: LoginController().validarClave,
              ),
              TextFormField(
                controller: _confirmClaveController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Confirmar Contraseña'),
                validator: (value) {
                  if (value != _claveController.text) {
                    return 'Las contraseñas no coinciden';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    LoginController.registrarUsuario(
                      _usuarioController.text,
                      _claveController.text,
                    );
                    Navigator.pop(context);
                  }
                },
                child: Text('Registrarse'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}