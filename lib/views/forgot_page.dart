import 'package:flutter/material.dart';

class RecuperarContraseniaForm extends StatelessWidget {
final _emailController = TextEditingController();
final _formKey = GlobalKey<FormState>();

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Recuperar Contraseña'),
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              'Ingrese su email para recuperar la contraseña',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese su email';
                }
                if (!value.contains('@')) {
                  return 'Ingrese un email válido';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Lógica para recuperar contraseña
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Procesando solicitud...')),
                  );
                  // Aquí iría la llamada a tu API o servicio
                }
              },
              child: Text('Enviar Solicitud'),
            ),
          ],
        ),
      ),
    ),
  );
}
}