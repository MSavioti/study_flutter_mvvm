import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_flutter_mvvm/src/modules/home/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: _heightController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Height',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _weightController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Weight',
              ),
            ),
            const SizedBox(height: 24.0),
            Consumer<HomeController>(
              builder: (_, value, __) {
                return ElevatedButton(
                  onPressed: () {
                    value.calculateImc(
                      height: _heightController.text,
                      weight: _weightController.text,
                    );
                  },
                  child: const Text('Calcular'),
                );
              },
            ),
            const SizedBox(height: 48.0),
            Consumer<HomeController>(
              builder: (_, value, __) {
                return Text(
                  value.imcRange,
                  style: const TextStyle(
                    fontSize: 24.0,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
