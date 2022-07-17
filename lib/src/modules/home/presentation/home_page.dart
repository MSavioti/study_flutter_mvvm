import 'package:flutter/material.dart';
import 'package:study_flutter_mvvm/src/modules/home/controller/home_controller.dart';
import 'package:study_flutter_mvvm/src/modules/home/model/person_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _message = '';
  double height = 0.0;
  double weight = 0.0;
  final HomeController _homeController = HomeController();

  void _calculateImc() {
    if (height > 0.0 && weight > 0.0) {
      setState(() {
        _message = _homeController.calculateImc(height: height, weight: weight);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => height = double.tryParse(value) ?? 0.0,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Height',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              onChanged: (value) => weight = double.tryParse(value) ?? 0.0,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Weight',
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _calculateImc,
              child: const Text('Calcular'),
            ),
            const SizedBox(height: 48.0),
            Text(
              _message,
              style: const TextStyle(
                fontSize: 24.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
