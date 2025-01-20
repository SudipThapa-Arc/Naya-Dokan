import 'package:flutter/material.dart';

class ColorDot extends StatelessWidget {
  final String color;
  final bool isSelected;
  final VoidCallback? onTap;

  const ColorDot({
    super.key,
    required this.color,
    this.isSelected = false,
    this.onTap,
  });

  Color _getColor(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'black':
        return Colors.black;
      case 'white':
        return Colors.white;
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      case 'navy':
        return Colors.blue.shade900;
      case 'grey':
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.all(2),
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected
                ? Theme.of(context).primaryColor
                : Colors.transparent,
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: _getColor(color),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
