import 'package:flutter/material.dart';

class ContainImageButton extends StatelessWidget {
  const ContainImageButton(
      {super.key,
      required this.background,
      required this.icon,
      required this.label,
      this.event});

  final Color background;
  final IconData icon;
  final String label;
  final Function? event;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        event!();
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: background,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            padding: const EdgeInsets.all(14),
            child: Icon(
              icon,
              color: Colors.white,
              size: 28,
            ),
          ),
          Text(label),
        ],
      ),
    );
  }
}
