import 'package:flutter/material.dart';
import 'package:pry_login_uno/themes/button_styles.dart';
import 'package:pry_login_uno/themes/text_styles.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.cyan, Colors.purpleAccent],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                // Encabezado con logo
                const Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_circle,
                        size: 100,
                        color: Colors.white,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Bienvenido a MiApp',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                // Mensaje de bienvenida
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Text(
                        'La mejor solución para tus necesidades',
                        style: AppTextStyles.input.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Inicia sesión o regístrate para comenzar',
                        style: AppTextStyles.input.copyWith(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                // Botones de acción
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        style: AppButtonStyles.signIn(context),
                        child: const Text('Iniciar Sesión',
                        style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 13),),
                      ),
                      const SizedBox(height: 15),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        style: AppButtonStyles.outline(context),
                        child: const Text('Registrarse',
                        style: TextStyle(color: Colors.white, fontSize: 13),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}