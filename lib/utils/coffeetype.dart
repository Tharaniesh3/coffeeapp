import 'package:flutter/material.dart';

class coffeetype extends StatelessWidget {
  final String coffee_type;
  final bool isselected;
  final VoidCallback ontap;
  coffeetype(
      {required this.coffee_type,
      required this.isselected,
      required this.ontap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Text(
        coffee_type,
        style: TextStyle(
            color: isselected ? Colors.orange : Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
