class BannerPriorityModel {
  String? id;
  String? priority;

  BannerPriorityModel({this.id, this.priority});

  BannerPriorityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    priority = json['priority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['priority'] = priority;
    return data;
  }
}
