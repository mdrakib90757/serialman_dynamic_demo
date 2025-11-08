import 'package:flutter/material.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppoinmentScreenState();
}

class _AppoinmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointments"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("appointmentScreen"),
      ),
    );
  }
}
