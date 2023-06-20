import 'package:flutter/material.dart';

/// Flutter code sample for [Switch].

void main() => runApp(const SwitchApp());

class SwitchApp extends StatelessWidget {
  const SwitchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const SwitchExample(),
    );
  }
}

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Switch Sample')),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(
              // This bool value toggles the switch.
              value: light,
              activeColor: Colors.red,
              onChanged: (bool value) {
                // This is called when the user toggles the switch.
                setState(() {
                  light = value;
                  debugPrint('state: $light');
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: ElevatedButton(
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 24.0),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NewScreen(
                            light: light,
                          )));
                },
              ),
            ),
          ],
        )));
  }
}

class NewScreen extends StatefulWidget {
  final bool light;

  const NewScreen({super.key, required this.light});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (widget.light) ? Colors.deepPurple : Colors.white,
      appBar: AppBar(title: const Text('New Screen')),
      body: Center(
        child: (!widget.light)
            ? const Text(
                'Hello world',
                style: TextStyle(color: Colors.black),
              )
            : const Text(
                'Bye world',
                style: TextStyle(color: Colors.white),
              ),
      ),
    );
  }
}
