import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pessoas = 0;

  bool get isFull => pessoas == 20;
  bool get isEmpty => pessoas == 0;

  DecorationImage _buildBackgroundImage() {
    return const DecorationImage(
      image: AssetImage('assets/images/background2.png'),
      fit: BoxFit.cover,
    );
  }

  Widget _buildTitle() {
    return Text(
      isFull ? "Lotado" : "Pode Entrar!",
      style: TextStyle(
        fontSize: 42,
        fontWeight: isFull ? FontWeight.w800 : FontWeight.normal,
        color: isFull ? Colors.red : Colors.white,
      ),
    );
  }

  Widget _buildVisitorCounter() {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        '$pessoas',
        style: TextStyle(
          color: isFull ? Colors.red : Colors.white,
          fontSize: 62,
          fontWeight: isFull ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildExitButton() {
    return TextButton(
      onPressed: isEmpty ? null : decrement,
      style: TextButton.styleFrom(
        backgroundColor: isEmpty ? Colors.white.withOpacity(0.2) : Colors.white,
        fixedSize: const Size(120, 120),
        overlayColor: Colors.red,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.elliptical(25, 25),
          ),
        ),
      ),
      child: const Text(
        "Saiu",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildEnterButton() {
    return TextButton(
      onPressed: isFull ? null : increment,
      style: TextButton.styleFrom(
        backgroundColor: isFull ? Colors.white.withOpacity(0.2) : Colors.white,
        fixedSize: const Size(120, 120),
        overlayColor: const Color(0xFF0000AA),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.elliptical(25, 25)),
        ),
      ),
      child: const Text(
        "Entrou",
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
    );
  }

  Widget _body() {
    return Container(
      decoration: BoxDecoration(image: _buildBackgroundImage()),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTitle(),
            _buildVisitorCounter(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildExitButton(),
                const SizedBox(width: 48),
                _buildEnterButton(),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF555555),
      body: _body(),
    );
  }

  void increment() {
    setState(
      () {
        isFull ? null : pessoas++;
      },
    );
  }

  void decrement() {
    setState(() {
      isEmpty ? null : pessoas--;
    });
  }
}
