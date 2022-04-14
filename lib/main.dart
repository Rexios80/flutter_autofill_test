import 'package:flutter/material.dart';

void main() {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: AutofillGroup(
          child: Column(
            children: [
              TextField(
                controller: emailController,
                autofillHints: const [AutofillHints.email],
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: passwordController,
                autofillHints: const [AutofillHints.password],
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: () {
                  emailController.clear();
                  passwordController.clear();
                },
                child: const Text('Clear'),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
