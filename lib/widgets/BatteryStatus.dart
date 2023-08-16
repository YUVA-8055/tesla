import 'package:flutter/material.dart';

class BatteryStatus extends StatelessWidget {
  const BatteryStatus({super.key, required this.constraints});

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "220 mi",
          style: TextStyle(color: Colors.white, fontSize: 50),
        ),
        Text(
          "62%",
          style: TextStyle(fontSize: 20),
        ),
        Spacer(),
        Text(
          "CHARGING",
          style: TextStyle(fontSize: 18),
        ),
        Text("18 min remaining", style: TextStyle(fontSize: 18)),
        SizedBox(
          height: constraints.maxHeight * 0.2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: DefaultTextStyle(
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("22 mi/hr"),
                Text("232 v  "),
              ],
            ),
          ),
        )
      ],
    );
  }
}
