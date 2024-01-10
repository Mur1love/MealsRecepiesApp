import 'package:flutter/material.dart';
import 'screens/category_screen.dart';
import 'screens/categories_meals_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink, 
          accentColor: Colors.amber, 
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 25,
          ), // Exemplo de configuração de estilo de texto
        ),
      ),
      home: const CategoriesScreen(),
      routes: {
        '/categories-meals': (ctx) => CategoriesMealsScreen(),
      },
    );
  }
}
