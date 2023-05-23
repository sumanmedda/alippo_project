import 'package:flutter/material.dart';

import '../controller/const.dart';
import '../controller/widgets/custom_appbar.dart';

class BannersHomePage extends StatelessWidget {
  final String id;
  final String image;
  const BannersHomePage({
    super.key,
    required this.image,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: const CustomAppBar(
          title: 'Banner',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(id),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: msize(context).width * 0.6,
              // height: msize(context).height * 0.3,
              child: Image.network(
                image,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
