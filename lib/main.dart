import 'package:autofill_test/constants.dart';
import 'package:flutter/material.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
              const Text(kFlutterInfo),
              Text('Built ${GetTimeAgo.parse(DateTime.parse(kBuildDate))}\n'),
              Row(
                children: const [
                  Text('View app built with Flutter channel '),
                  ChannelButton(channel: 'stable'),
                  Text('/'),
                  ChannelButton(channel: 'beta'),
                  Text('/'),
                  ChannelButton(channel: 'master'),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class ChannelButton extends StatelessWidget {
  final String channel;

  const ChannelButton({super.key, required this.channel});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => launchUrlString('../$channel'),
      child: Text(channel),
    );
  }
}
