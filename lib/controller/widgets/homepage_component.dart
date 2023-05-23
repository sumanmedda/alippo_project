import 'package:flutter/material.dart';

class HomepageComponent extends StatelessWidget {
  const HomepageComponent({
    super.key,
    required this.itemName,
    required this.widget,
  });

  final String itemName;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(itemName.toUpperCase()),
          widget,
        ],
      ),
    );
  }
}
