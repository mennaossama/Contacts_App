import 'package:flutter/material.dart';

class ContactTile extends StatelessWidget {
  final String name;
  final String number;
  final VoidCallback onTap;
  ContactTile({required this.name, required this.number, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(
            name[0],
            style: TextStyle(color: Colors.white),
          ),
        ),
        title: Text(name,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        subtitle: Text(number,
            style: TextStyle(
                color: Colors.grey[500], fontWeight: FontWeight.bold)),
        onTap: onTap,
      ),
    );
  }
}
