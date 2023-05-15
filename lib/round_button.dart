import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String label;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final bool? isLoading;

  const RoundButton({
    required this.label,
    this.onPressed,
    this.backgroundColor,
    this.isLoading,
    super.key,
  });

  Widget _renderLabel() {
    if (isLoading == true) {
      return const CircularProgressIndicator(
        color: Colors.white,
        strokeWidth: 3,
      );
    }

    return Text(label);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading == true ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
        child: _renderLabel(),
      ),
    );
  }
}
