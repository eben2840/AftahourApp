import 'package:flutter/material.dart';

Widget _buildTag(IconData icon, String label) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.6),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        Icon(icon, color: Colors.white, size: 16),
        SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}
