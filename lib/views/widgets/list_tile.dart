import 'package:flutter/material.dart';

class LISTTILE extends StatelessWidget {
  final IconData logo;
  final String title;
  final String subtitle;

  const LISTTILE(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.logo});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(logo),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.teal, width: 2),
          ),
          padding: const EdgeInsets.all(4),
          child: const Icon(
            Icons.check,
            color: Colors.teal,
            size: 20,
          ),
        ),
      ),
    );
  }
}
