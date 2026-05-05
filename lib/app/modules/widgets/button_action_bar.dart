import 'dart:async';
import 'package:flutter/material.dart';

class DeleteActionBar extends StatefulWidget {
  final String title;
  final VoidCallback onUndo;
  final VoidCallback onDelete;

  const DeleteActionBar({
    super.key,
    required this.title,
    required this.onUndo,
    required this.onDelete,
  });

  @override
  State<DeleteActionBar> createState() => _DeleteActionBarState();
}

class _DeleteActionBarState extends State<DeleteActionBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slide;

  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    // ⏳ Auto dismiss after 4 seconds
    _timer = Timer(const Duration(seconds: 4), () {
      widget.onDelete();
      _hide();
    });
  }

  void _hide() {
    _controller.reverse().then((_) {
      if (mounted) Navigator.of(context).pop();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SlideTransition(
        position: _slide,
        child: Material(
          elevation: 10,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.3),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: SafeArea(
              top: false,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),

                  // 🟢 UNDO
                  TextButton(
                    onPressed: () {
                      _timer?.cancel();
                      widget.onUndo();
                      _hide();
                    },
                    child: const Text(
                      "UNDO",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // 🔴 DELETE
                  TextButton(
                    onPressed: () {
                      _timer?.cancel();
                      widget.onDelete();
                      _hide();
                    },
                    child: const Text(
                      "DELETE",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
