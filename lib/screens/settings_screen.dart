import 'package:flutter/material.dart';
import '../components/main_drawer.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key, required this.onSettingsChanged, required this.settings});

  final Function(Settings) onSettingsChanged;
  final Settings settings;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  late Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Configuracoes'),
      ),
      // ignore: prefer_const_constructors
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Configuracoes',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'Sem Gluten',
                  'So exibe refeicoes sem Gluten',
                  settings.isGlutenFree,
                  (bool value) {
                    setState(() => settings.isGlutenFree = value);
                  },
                ),
                _createSwitch(
                  'Sem Lactose',
                  'So exibe refeicoes sem Lactose',
                  settings.isLactoseFree,
                  (bool value) {
                    setState(() => settings.isLactoseFree = value);
                  },
                ),
                _createSwitch(
                  'Vegana',
                  'So exibe refeicoes Veganas',
                  settings.isVegan,
                  (bool value) {
                    setState(() => settings.isVegan = value);
                  },
                ),
                _createSwitch(
                  'Vegetariana',
                  'So exibe refeicoes Vegetarianas',
                  settings.isVegetarian,
                  (bool value) {
                    setState(() => settings.isVegetarian = value);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
