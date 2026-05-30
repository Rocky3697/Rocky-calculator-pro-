import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'providers/calculator_provider.dart';
import 'providers/theme_provider.dart';
import 'screens/home_screen.dart';

void main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Lock orientation to portrait for a consistent calculator UI
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => CalculatorProvider()),
      ],
      child: const RockyCalculatorApp(),
    ),
  );
}

class RockyCalculatorApp extends StatelessWidget {
  const RockyCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the ThemeProvider to listen for dark/light mode changes
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Rocky Calculator Pro',
      debugShowCheckedModeBanner: false,
      
      // Use Material 3 design system
      theme: themeProvider.currentTheme,
      
      // Initial Screen
      home: const HomeScreen(),

      // Standard transitions for a modern feel
      builder: (context, child) {
        return MediaQuery(
          // Fix font scaling to prevent UI break on large system fonts
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child!,
        );
      },
    );
  }
}
