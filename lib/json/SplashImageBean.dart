class SplashImageBean {
  Data data;
  Status status;

  SplashImageBean({this.data, this.status});

  SplashImageBean.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    if (this.status != null) {
      data['status'] = this.status.toJson();
    }
    return data;
  }
}

class Data {
  String enddate;
  String url;
  Null bmiddlePic;
  Null originalPic;
  Null thumbnailPic;
  String copyright;

  Data(
      {this.enddate,
      this.url,
      this.bmiddlePic,
      this.originalPic,
      this.thumbnailPic,
      this.copyright});

  Data.fromJson(Map<String, dynamic> json) {
    enddate = json['enddate'];
    url = json['url'];
    bmiddlePic = json['bmiddle_pic'];
    originalPic = json['original_pic'];
    thumbnailPic = json['thumbnail_pic'];
    copyright = json['copyright'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enddate'] = this.enddate;
    data['url'] = this.url;
    data['bmiddle_pic'] = this.bmiddlePic;
    data['original_pic'] = this.originalPic;
    data['thumbnail_pic'] = this.thumbnailPic;
    data['copyright'] = this.copyright;
    return data;
  }
}

class Status {
  int code;
  String message;

  Status({this.code, this.message});

  Status.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}
