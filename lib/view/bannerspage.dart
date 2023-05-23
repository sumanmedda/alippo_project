import 'package:flutter/material.dart';

import '../controller/const.dart';
import '../controller/widgets/custom_appbar.dart';

class BannersHomePage extends StatelessWidget {
  const BannersHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: const CustomAppBar(
          title: 'Banner',
        ),
      ),
    );
  }
}
