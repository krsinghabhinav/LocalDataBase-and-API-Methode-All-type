class sendjobPostModel {
  String? name;
  String? job;

  sendjobPostModel({this.name, this.job});

  sendjobPostModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    job = json['job'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['job'] = this.job;
    return data;
  }
}
