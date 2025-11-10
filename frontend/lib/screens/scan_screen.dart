import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import '../controllers/main_controller.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  bool _handled = false; // prevent multiple triggers

  @override
  Widget build(BuildContext context) {
    final main = context.read<MainController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Scan Barcode')),
      body: Stack(
        children: [
          MobileScanner(
            // Don’t spam results
            onDetect: (capture) async {
              if (_handled) return;
              final codes = capture.barcodes;
              if (codes.isEmpty) return;

              final value = codes.first.rawValue;
              if (value == null || value.trim().isEmpty) return;

              _handled = true;
              await main.checkProductByBarcode(value.trim());

              if (!mounted) return;
              Navigator.pop(context); // go back to show result in previous UI
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Point camera at a barcode',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
