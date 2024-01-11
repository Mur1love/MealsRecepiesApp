// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import '../utils/app_routes.dart';



class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _createItem(IconData icon, String label, VoidCallback onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 280,
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.maxFinite,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomRight,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Vamos Cozinhar?',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _createItem(
            Icons.restaurant,
            'Refeicoes',
            () => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME) 
          ),
          _createItem(
            Icons.settings,
            'Configuracoes',
            () => Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS)
          ),
        ],
      ),
    );
  }
}
