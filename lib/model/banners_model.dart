class BannersModel {
  String? id;
  String? bannerURL;

  BannersModel({this.id, this.bannerURL});

  BannersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bannerURL = json['bannerURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['bannerURL'] = bannerURL;
    return data;
  }
}
