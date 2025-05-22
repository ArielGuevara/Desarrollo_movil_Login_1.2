import 'package:flutter/material.dart';
import 'package:pry_login_uno/controllers/login_controller.dart';
import 'package:pry_login_uno/themes/text_styles.dart';
import 'package:pry_login_uno/themes/button_styles.dart';
import 'forgot_page.dart';

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final usuarioController = TextEditingController();
  final claveController = TextEditingController();
  bool _obscureText = true;
  bool recordarCheck = false;
  bool _isLoading = false; // Para controlar el estado de carga

  final controller = LoginController();

  @override
  void dispose() {
    usuarioController.dispose();
    claveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.cyan, Colors.purpleAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: SingleChildScrollView(
            child: Form( // Envuelve el Column con Form
              key: _formKey,
              child: Column(
                children: [
                  Icon(Icons.person, size: 100, color: Colors.white),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: usuarioController,
                    style: AppTextStyles.input,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Colors.white),
                      hintText: 'Username',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 13),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: controller.validarUsuario,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: claveController,
                    obscureText: _obscureText,
                    style: AppTextStyles.input,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.white),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 13),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() => _obscureText = !_obscureText);
                        },
                      ),
                    ),
                    validator: controller.validarClave, // Cambiado a validarClave
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: recordarCheck,
                            onChanged: (bool? value) {
                              setState(() => recordarCheck = value!);
                            },
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                                  (states) => recordarCheck
                                  ? Colors.white
                                  : Colors.transparent,
                            ),
                            checkColor: Colors.purpleAccent,
                          ),
                          Text('Recuérdame', style: TextStyle(color: Colors.white, fontSize: 12)),
                        ],
                      ),
                      TextButton(
                        style: AppButtonStyles.ancle(context),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RecuperarContraseniaForm()),
                          );
                        },
                        child: Text(
                          '¿Olvidó su contraseña?',
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: AppButtonStyles.signIn(context),
                      onPressed: _isLoading
                          ? null
                          : () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() => _isLoading = true);
                          await controller.iniciarSesion(
                            context,
                            usuarioController.text,
                            claveController.text,
                            recordarCheck,
                          );
                          if (mounted) setState(() => _isLoading = false);
                        }
                      },
                      child: _isLoading
                          ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      )
                          : Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.purpleAccent,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Not a member?', style: TextStyle(color: Colors.white)),
                  SizedBox(height: 10),
                  OutlinedButton(
                    style: AppButtonStyles.borderedWhite(context),
                    onPressed: () => Navigator.pushNamed(context, '/register'),
                    child: Text(
                      'Create account',
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}