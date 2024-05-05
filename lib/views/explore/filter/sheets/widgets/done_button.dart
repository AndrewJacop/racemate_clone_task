import 'package:flutter/material.dart';

class DoneButton extends StatelessWidget {
  const DoneButton({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            "Done",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ),
    );
  }
}
