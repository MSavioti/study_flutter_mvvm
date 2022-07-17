import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_flutter_mvvm/src/modules/home/controller/home_controller.dart';
import 'package:study_flutter_mvvm/src/modules/home/presentation/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<HomeController>(
        create: (context) => HomeController(),
        child: HomePage(),
      ),
    );
  }
}
