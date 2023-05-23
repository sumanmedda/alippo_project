import 'package:flutter/material.dart';

import '../controller/const.dart';
import '../controller/widgets/custom_appbar.dart';

class MostPopularPage extends StatelessWidget {
  final String title;
  final String image;
  final String desc;
  const MostPopularPage({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: const CustomAppBar(
          title: 'Most Popular',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(title),
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
            const SizedBox(
              height: 10,
            ),
            Text(desc),
          ],
        ),
      ),
    );
  }
}
