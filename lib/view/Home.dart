import 'package:flutter/material.dart';

import 'package:micaniciens_app/view/QRViewExample.dart';

class Home extends StatefulWidget {
  final String MicanicienID;

  const Home({super.key, required this.MicanicienID});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign out'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.assignment_ind_rounded),
              ),
              Tab(
                icon: Icon(Icons.car_crash_sharp),
              ),
              Tab(
                icon: Icon(Icons.circle_notifications),
              ),
               Tab(
                icon: Icon(Icons.airport_shuttle),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            
             Center(
              
              child: QRViewExample(ID1: widget.MicanicienID),
            ),
             
          ],
        ),
      ),
    );
  }
}
