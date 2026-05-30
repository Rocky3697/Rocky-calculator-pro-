
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/calculator_provider.dart';
import 'scientific_screen.dart';
import 'ai_calculator_screen.dart';
import 'history_screen.dart';
import 'tools/gst_screen.dart';
import 'tools/emi_screen.dart';
import 'tools/age_screen.dart';
import 'tools/converter_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final calc = Provider.of<CalculatorProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Rocky Calculator Pro")),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Center(child: Text("PRO TOOLS", style: TextStyle(fontSize: 24)))),
            ListTile(leading: const Icon(Icons.science), title: const Text("Scientific"), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ScientificScreen()))),
            ListTile(leading: const Icon(Icons.auto_awesome), title: const Text("AI Calculator"), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AICalculatorScreen()))),
            ListTile(leading: const Icon(Icons.receipt), title: const Text("GST Calculator"), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const GstScreen()))),
            ListTile(leading: const Icon(Icons.money), title: const Text("EMI Calculator"), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const EmiScreen()))),
            ListTile(leading: const Icon(Icons.cake), title: const Text("Age Calculator"), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AgeScreen()))),
            ListTile(leading: const Icon(Icons.swap_horiz), title: const Text("Converter"), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ConverterScreen()))),
            ListTile(leading: const Icon(Icons.history), title: const Text("History"), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const HistoryScreen()))),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(child: Container(alignment: Alignment.bottomRight, padding: const EdgeInsets.all(24), child: Text(calc.equation, style: const TextStyle(fontSize: 32)))),
          Expanded(child: Container(alignment: Alignment.bottomRight, padding: const EdgeInsets.all(24), child: Text(calc.result, style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold)))),
          _buildKeypad(context),
        ],
      ),
    );
  }

  Widget _buildKeypad(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: ["AC", "DEL", "%", "÷", "7", "8", "9", "×", "4", "5", "6", "-", "1", "2", "3", "+", "0", ".", "00", "="].map((btn) => _btn(context, btn)).toList(),
      ),
    );
  }

  Widget _btn(BuildContext context, String txt) {
    final calc = Provider.of<CalculatorProvider>(context, listen: false);
    return ElevatedButton(
      onPressed: () {
        if (txt == "AC") calc.clearAll();
        else if (txt == "DEL") calc.deleteLast();
        else if (txt == "=") calc.calculateResult();
        else calc.addToEquation(txt);
      },
      child: Text(txt, style: const TextStyle(fontSize: 20)),
    );
  }
}
