import 'package:flutter/material.dart';
import '../models/threat.dart';
import 'package:intl/intl.dart';

class ThreatCard extends StatelessWidget {
  final Threat threat;

  ThreatCard({required this.threat});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(threat.name),
        subtitle: Text(threat.description),
        trailing: Text(
          DateFormat.yMd()
              .format(threat.dateDetected), // Exibe a data formatada
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
