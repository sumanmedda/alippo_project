import 'package:alippo_project/view/bannerspage.dart';
import 'package:flutter/material.dart';

import '../../model/banner/banners_model.dart';
import '../const.dart';

class BannersWidget extends StatelessWidget {
  final List<BannersModel> state;

  const BannersWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: msize(context).height * 0.2,
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
                    builder: (context) => BannersHomePage(
                      image: path.bannerURL!,
                      id: path.id!,
                    ),
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
