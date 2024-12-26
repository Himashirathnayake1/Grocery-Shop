import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tap_on/User/LaunchPage.dart';
import 'package:tap_on/providers/cart_provider.dart';
import 'package:tap_on/constants.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const InitialScreen(),
    ),
  );
}

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LaunchPage(),
      title: appName,
      debugShowCheckedModeBanner: false,
    );
  }
}
