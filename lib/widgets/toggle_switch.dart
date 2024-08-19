import 'package:flutter/material.dart';

class ToggleSwitch extends StatefulWidget {
  @override
  _ToggleSwitchState createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Switch(
        value: _switchValue,
        onChanged: (value) {
          setState(() {
            _switchValue = value;
          });
        },
      ),
    );
  }
}
