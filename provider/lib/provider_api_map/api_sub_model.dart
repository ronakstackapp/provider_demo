  class VimeoData {

  String? title;
  String? status;
  DateTime? startTime;
  String? thumbnail;

  VimeoData({this.title, this.status, this.startTime, this.thumbnail});

  VimeoData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    status = json['status'];
    startTime = json['startTime'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['status'] = this.status;
    data['startTime'] = this.startTime;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}

/*
class VideoModel{
    String? status;
    String? title;
    String? startTime;
    String? thumbnail;


    VideoModel({this.status,this.title,this.startTime,this.thumbnail});





    Map<String,dynamic>  toJson(){
     final Map<String,dynamic> data = Map<String,dynamic>();
        data['clip_to_play']['live']['status'] = this.status;
        data['title'] = this.title;
        data['clip_to_play']['live']['scheduled_start_time'] = this.startTime;
        data['pictures']['base_link'] = this.thumbnail;

        return data;
    }


    factory VideoModel.fromJson( json){

    }


    *//*VideoModel.fromJson(Map<String,dynamic> json){
      status : json['clip_to_play']['live']['status'];
      title : json['title'] ?? '';
      startTime: json['clip_to_play']['live']['scheduled_start_time'] ?? '';
      thumbnail: json['pictures']['base_link'];
    }*//*

}*/


