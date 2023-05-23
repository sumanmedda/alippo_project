import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title.toUpperCase()),
    );
  }
}
