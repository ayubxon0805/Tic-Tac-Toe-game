import 'package:flutter/material.dart';

class WButton extends StatelessWidget {
  final String icon;
  final GestureTapCallback onTap;
  const WButton({Key? key, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            icon,
            width: 143,
            height: 143,
          ),
        ),
      ),
    );
  }
}
