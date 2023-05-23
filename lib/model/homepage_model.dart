class HomepageAPIsModel {
  String? id;
  String? apiPath;
  String? priority;

  HomepageAPIsModel({this.id, this.apiPath, this.priority});

  HomepageAPIsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    apiPath = json['apiPath'];
    priority = json['priority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['apiPath'] = apiPath;
    data['priority'] = priority;
    return data;
  }
}
