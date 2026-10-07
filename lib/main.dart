import 'package:flutter/material.dart';
import 'screens/portfolio_home_screen.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pedro Henrique | Portfólio Artístico',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const PortfolioHomeScreen(),
    );
  }
}
