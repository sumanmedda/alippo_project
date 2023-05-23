import 'package:alippo_project/view/bannerspage.dart';
import 'package:flutter/material.dart';

import '../../model/banners_model.dart';

class BannersWidget extends StatelessWidget {
  final List<BannersModel> state;

  const BannersWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.2,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: state.length,
          itemBuilder: (context, index) {
            var path = state[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BannersHomePage(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(path.bannerURL!),
              ),
            );
          }),
    );
  }
}
