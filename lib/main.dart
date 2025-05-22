import 'package:flutter/material.dart';
import 'package:pry_login_uno/views/register_page.dart';
import 'package:pry_login_uno/views/welcome_page.dart';
import 'themes/color_schemes.dart';
import 'package:pry_login_uno/themes/text_styles.dart';
import 'package:pry_login_uno/themes/button_styles.dart';
import 'package:pry_login_uno/views/login_page.dart';

void main() {
  runApp( Login());
}

class Login extends StatelessWidget {
  const Login({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: AppColorSchemes.light,
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: AppButtonStyles.primary(context),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: AppButtonStyles.outline(context),
        ),
        textTheme: TextTheme(
          bodyLarge: AppTextStyles.input.copyWith(
            color: AppColorSchemes.light.onSurface,
          ),
          titleLarge: AppTextStyles.heading.copyWith(
            color: AppColorSchemes.light.primary,
          ),
          labelLarge: AppTextStyles.button,
        ),

      ),
      home: LoginPage(),
    routes: {
    '/welcome': (context) => WelcomePage(),
      '/login': (context)=>LoginPage(),
      '/register': (context)=>RegisterPage()
      }
    );
  }
}


