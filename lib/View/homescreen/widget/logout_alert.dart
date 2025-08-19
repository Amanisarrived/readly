import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LogoutDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const LogoutDialog({
    super.key,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      titlePadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
      contentPadding: const EdgeInsets.fromLTRB(24, 10, 24, 20),
      title: Row(
        children: [
          Icon(Iconsax.logout4, color: Theme.of(context).primaryColor),
          const SizedBox(width: 10),
          const Text(
            "Logout",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
        ],
      ),
      content: const Text(
        "Taking a break? We'll keep your bookshelf safe until you’re back.",
        style: TextStyle(fontSize: 15, height: 1.4),
      ),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      actions: [
        TextButton(
          onPressed: onCancel,
          style: TextButton.styleFrom(foregroundColor: Colors.grey[700]),
          child: const Text("Cancel", style: TextStyle(fontSize: 14)),
        ),
        ElevatedButton(
          onPressed: onConfirm,
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          child: const Text(
            "Logout",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
