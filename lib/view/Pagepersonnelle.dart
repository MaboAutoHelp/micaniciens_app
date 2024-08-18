import 'package:flutter/material.dart';
import 'package:micaniciens_app/controller/PagepersonnelleController.dart';

class Pagepersonnelle extends StatefulWidget {
  final String MicanicienID;
  const Pagepersonnelle({super.key, required this.MicanicienID});

  @override
  State<Pagepersonnelle> createState() => _PagepersonnelleState();
}

class _PagepersonnelleState extends State<Pagepersonnelle> {
  late Future<Map<String, dynamic>> _MicanicienData;

  @override
  void initState() {
    super.initState();
    _MicanicienData =  Pagepersonnellecontroller().GetMicanicien(widget.MicanicienID);
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
     
      body: FutureBuilder<Map<String, dynamic>>(
        future: _MicanicienData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            // Assuming that the name is stored in 'name' field
            String adminName = snapshot.data!['username'] ?? 'Unknown Admin';
            String adminpassword = snapshot.data!['password'] ?? 'Unknown Admin';
            return Center(
              child: Text(
                adminName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // هنا تغير اللون كما تريد
                ),
              ),
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
