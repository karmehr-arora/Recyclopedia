import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/main_controller.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MainController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MainController>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recyclopedia',
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Recyclopedia")),
        body: controller.currentPage,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.login), label: "Login"),
            BottomNavigationBarItem(icon: Icon(Icons.person_add), label: "Sign Up"),
          ],
          onTap: controller.setIndex,
        ),
      ),
    );
  }
}
