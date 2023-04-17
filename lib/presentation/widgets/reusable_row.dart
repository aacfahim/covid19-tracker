import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title.toString()),
              Text(value.toString()),
            ],
          ),
          SizedBox(height: 5),
          Divider(),
        ],
      ),
    );
  }
}
