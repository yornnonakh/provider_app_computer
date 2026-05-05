import 'package:flutter/material.dart';

class NotificationButton extends StatelessWidget {
  final VoidCallback? onTap;

  const NotificationButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        width: 45,
        height: 45,
        decoration: _boxDecoration(BuildContext, context),
        child: Icon(Icons.notifications, color: Theme.of(context).primaryColor),
      ),
    );
  }

  // ignore: non_constant_identifier_names, avoid_types_as_parameter_names, strict_top_level_inference
  BoxDecoration _boxDecoration(BuildContext, context) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).primaryColor.withOpacity(0.05),
          blurRadius: 10,
        ),
      ],
    );
  }
}
