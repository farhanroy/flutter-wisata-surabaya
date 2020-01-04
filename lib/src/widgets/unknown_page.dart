import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget {
  final String message;

  const UnknownPage(this.message);
  @override
  Widget build(BuildContext context) {
    return Container(child: Text(message),);
  }
}
