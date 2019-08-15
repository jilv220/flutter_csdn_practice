class JokeModel {
  int code;
  String message;
  List<Result> result;

  JokeModel({this.code, this.message, this.result});

  JokeModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['result'] != null) {
      result = new List<Result>();
      json['result'].forEach((v) {
        result.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String sid;
  String text;
  String type;
  String thumbnail;
  String video;
  String images;
  String up;
  String down;
  String forward;
  String comment;
  String uid;
  String name;
  String header;
  String topCommentsContent;
  String topCommentsVoiceuri;
  String topCommentsUid;
  String topCommentsName;
  String topCommentsHeader;
  String passtime;

  Result(
      {this.sid,
        this.text,
        this.type,
        this.thumbnail,
        this.video,
        this.images,
        this.up,
        this.down,
        this.forward,
        this.comment,
        this.uid,
        this.name,
        this.header,
        this.topCommentsContent,
        this.topCommentsVoiceuri,
        this.topCommentsUid,
        this.topCommentsName,
        this.topCommentsHeader,
        this.passtime});

  Result.fromJson(Map<String, dynamic> json) {
    sid = json['sid'];
    text = json['text'];
    type = json['type'];
    thumbnail = json['thumbnail'];
    video = json['video'];
    images = json['images'];
    up = json['up'];
    down = json['down'];
    forward = json['forward'];
    comment = json['comment'];
    uid = json['uid'];
    name = json['name'];
    header = json['header'];
    topCommentsContent = json['top_comments_content'];
    topCommentsVoiceuri = json['top_comments_voiceuri'];
    topCommentsUid = json['top_comments_uid'];
    topCommentsName = json['top_comments_name'];
    topCommentsHeader = json['top_comments_header'];
    passtime = json['passtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sid'] = this.sid;
    data['text'] = this.text;
    data['type'] = this.type;
    data['thumbnail'] = this.thumbnail;
    data['video'] = this.video;
    data['images'] = this.images;
    data['up'] = this.up;
    data['down'] = this.down;
    data['forward'] = this.forward;
    data['comment'] = this.comment;
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['header'] = this.header;
    data['top_comments_content'] = this.topCommentsContent;
    data['top_comments_voiceuri'] = this.topCommentsVoiceuri;
    data['top_comments_uid'] = this.topCommentsUid;
    data['top_comments_name'] = this.topCommentsName;
    data['top_comments_header'] = this.topCommentsHeader;
    data['passtime'] = this.passtime;
    return data;
  }
}
