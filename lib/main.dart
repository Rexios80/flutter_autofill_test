import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: AutofillGroup(
          child: Column(
            children: const [
              TextField(
                autofillHints: [AutofillHints.email],
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                autofillHints: [AutofillHints.password],
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
