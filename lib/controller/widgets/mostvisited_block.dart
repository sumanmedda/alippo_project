import 'package:alippo_project/view/mostvisitedpage.dart';
import 'package:flutter/material.dart';

import '../../model/mostvisited_model.dart';
import '../const.dart';

class MostVisitedWidget extends StatelessWidget {
  final List<MostVisitedModel> state;
  const MostVisitedWidget({
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
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(12)),
                height: msize(context).height,
                width: msize(context).width * 0.5,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MostVisitedPage(
                            image: path.image!,
                            title: path.title!,
                            desc: path.description!),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(path.title!),
                    subtitle: Text(path.description!),
                    trailing: SizedBox(
                      height: msize(context).height * 0.05,
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
