import 'package:flutter/material.dart';

class DeliveryLocationSection extends StatelessWidget {
  const DeliveryLocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deliver now',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          GestureDetector(
            onTap: () async => await openLocationSearchBox(context),
            child: Row(
              children: [
                Text(
                  'benha, 15 street',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future<dynamic> openLocationSearchBox(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: const Text('Your location'),
      content: const TextField(
        decoration: InputDecoration(hintText: "Search address..."),
      ),
      actions: [
        MaterialButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
        MaterialButton(
          child: const Text('Save'),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ),
  );
}
