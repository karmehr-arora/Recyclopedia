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
        scaffoldBackgroundColor: Colors.grey[50],
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Recyclopedia",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: controller.currentPage,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          onTap: controller.setIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: "Dashboard",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.login),
              label: "Login",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_add),
              label: "Sign Up",
            ),
          ],
        ),
      ),
    );
  }
}
