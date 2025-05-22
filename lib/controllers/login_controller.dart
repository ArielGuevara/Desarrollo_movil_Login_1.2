import 'package:flutter/material.dart';

class LoginController {
  // Lista para almacenar usuarios registrados
  static final List<Map<String, String>> _usuarios = [
    {'usuario': 'Ariel', 'clave': 'admin123'}, // Usuario por defecto
  ];

  // Método para registrar nuevos usuarios
  static void registrarUsuario(String usuario, String clave) {
    _usuarios.add({
      'usuario': usuario,
      'clave': clave,
    });
  }

  // Validación de usuario
  String? validarUsuario(String? value) {
    if (value == null || value.isEmpty) return 'Se requiere usuario';
    if (value.length < 3) return 'Mínimo 3 caracteres';
    return null;
  }

  // Validación de clave
  String? validarClave(String? value) {
    if (value == null || value.isEmpty) return 'Se requiere contraseña';
    if (value.length < 8) return 'Mínimo 8 caracteres';
    return null;
  }

  // Inicio de sesión
  Future<void> iniciarSesion(
      BuildContext context,
      String usuario,
      String clave,
      bool recordar,
      ) async {
    try {
      // Simulamos un proceso de autenticación
      await Future.delayed(const Duration(milliseconds: 500));

      // Buscar usuario en la lista
      final usuarioValido = _usuarios.any((u) =>
      u['usuario'] == usuario && u['clave'] == clave);

      if (usuarioValido) {
        // Navegar a welcome y limpiar el stack
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/welcome',
          arguments: usuario,
              (route) => false,
        );

        // Opcional: Guardar credenciales si "Recordar" está activado
        if (recordar) {
          // Aquí podrías usar SharedPreferences para persistencia
        }
      } else {
        throw 'Credenciales incorrectas';
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}