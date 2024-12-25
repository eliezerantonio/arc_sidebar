import 'package:flutter/material.dart';

class SideBarItem extends StatelessWidget {
  const SideBarItem({
    super.key,
    this.icon,
    this.style,
    this.iconColor,
    required this.title,
    required this.onTap,
  });

  final IconData? icon;
  final String title;
  final void Function()? onTap;
  final TextStyle? style;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            if (icon != null) ...[Icon(icon, size: 30, color: iconColor), const SizedBox(width: 20)],
            Text(title, style: style ?? TextStyle(fontWeight: FontWeight.w300, fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
