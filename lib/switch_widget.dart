import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: AdvancedSwitchExample(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
    ),
  );
}

class AdvancedSwitchExample extends StatefulWidget {
  @override
  _AdvancedSwitchExampleState createState() => _AdvancedSwitchExampleState();
}

class _AdvancedSwitchExampleState extends State<AdvancedSwitchExample> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification Settings"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isSwitched ? Icons.notifications_active : Icons.notifications_off_outlined,
                    size: 60,
                    color: isSwitched ? Colors.green : Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Enable Notifications",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text(
                    isSwitched
                        ? "You will now receive notifications."
                        : "Notifications are currently turned off.",
                    style: TextStyle(color: Colors.grey[700]),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Switch.adaptive(
                    value: isSwitched,
                    activeColor: Colors.green,
                    inactiveThumbColor: Colors.grey,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
