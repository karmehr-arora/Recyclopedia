// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/main_controller.dart';
import 'screens/dashboard.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/scan_screen.dart'; // <-- uses mobile_scanner

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recyclopedia',
      home: const RootScaffold(),
      routes: {
        '/check': (_) => const CheckScreen(), // manual entry screen
        '/scan':  (_) => const ScanScreen(),  // camera scanner screen
      },
    );
  }
}

class RootScaffold extends StatelessWidget {
  const RootScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.watch<MainController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Recyclopedia')),
      body: _CurrentPage(index: c.currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: c.currentIndex,
        onTap: c.setIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Login'),
          BottomNavigationBarItem(icon: Icon(Icons.person_add), label: 'Sign Up'),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).pushNamed('/scan'),
        label: const Text('Scan/Check'),
        icon: const Icon(Icons.qr_code_scanner),
      ),
    );
  }
}

class _CurrentPage extends StatelessWidget {
  final int index;
  const _CurrentPage({required this.index});

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return const Dashboard();
      case 1:
        return const LoginScreen();
      case 2:
        return const SignUpScreen();
      default:
        return const Dashboard();
    }
  }
}

class CheckScreen extends StatefulWidget {
  const CheckScreen({super.key});
  @override
  State<CheckScreen> createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final main = context.watch<MainController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Recyclopedia')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter Barcode',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await context
                        .read<MainController>()
                        .checkProductByBarcode(_controller.text.trim());
                  },
                  child: const Text('Check Recyclability'),
                ),
                const SizedBox(width: 12),
                OutlinedButton.icon(
                  onPressed: () => Navigator.of(context).pushNamed('/scan'),
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('Scan'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            if (main.checking)
              const Center(child: CircularProgressIndicator())
            else if (main.checkError != null)
              Text(main.checkError!, style: const TextStyle(color: Colors.red))
            else if (main.productInfo != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Product: ${main.productInfo!['product_name']}"),
                    Text("Material: ${main.productInfo!['material']}"),
                    Text("Recyclable: ${main.productInfo!['recyclable'] ? 'Yes' : 'No'}"),
                    Text("Instructions: ${main.productInfo!['instructions']}"),
                  ],
                )
              else
                const Text("Enter a barcode to check recyclability."),
          ],
        ),
      ),
    );
  }
}
