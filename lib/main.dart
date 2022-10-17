import 'package:autofill_test/constants.dart';
import 'package:flutter/material.dart';

void main() {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Autofill Test')),
        body: AutofillGroup(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              TextField(
                controller: emailController,
                autofillHints: const [AutofillHints.email],
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                autofillHints: const [AutofillHints.password],
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  emailController.clear();
                  passwordController.clear();
                },
                child: const Text('Clear'),
              ),
              const SizedBox(height: 16),
              const Text(
                'Built with Flutter channel $kFlutterChannel version $kFlutterFrameworkVersion',
              )
            ],
          ),
        ),
      ),
    ),
  );
}
