import 'package:alippo_project/view/mostpopularpage.dart';
import 'package:flutter/material.dart';

import '../../model/mostpopular_model.dart';

class MostPopularWidget extends StatelessWidget {
  final List<MostPopularModel> state;
  const MostPopularWidget({
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
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(12)),
                height: 200,
                width: 200,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MostPopularPage(),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(path.title!),
                    subtitle: Text(path.description!),
                    trailing: SizedBox(
                      height: size.height * 0.05,
                      child: Image.network(
                        path.image!,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
