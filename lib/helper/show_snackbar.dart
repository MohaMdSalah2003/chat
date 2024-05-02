
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String Messege) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(Messege)));
}