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
    _MicanicienData = Pagepersonnellecontroller().GetMicanicien(widget.MicanicienID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Personnelle'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _MicanicienData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            // استخراج البيانات من الـ snapshot
            String name = snapshot.data!['name'] ?? 'Unknown Name';
            String special = snapshot.data!['special'] ?? 'Unknown Special';
            double revenu = snapshot.data!['Revenu']?.toDouble() ?? 0.0;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: $name',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Special: $special',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Revenu: \$${revenu.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                    ),
                  ),
                ],
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
