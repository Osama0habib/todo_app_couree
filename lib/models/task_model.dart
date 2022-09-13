// class TaskModel {
//    int? id;
//    String? title;
//    String? body;
//    String? time;
//    int? status;
//
//   TaskModel({this.id, this.title, this.body, this.time, this.status});
//
//
//   TaskModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     body = json['body'];
//     time = json['time'];
//     status = json['status'];
//   }
//    Map<String, dynamic> toJson() {
//      final Map<String, dynamic> data =  <String, dynamic>{};
//      data['id'] = id;
//      data['title'] = title;
//      data['body'] = body;
//      data['time'] = time;
//      data['status'] = status;
//      return data;
//    }
// }

class TaskModel {

  int? id;
  String? title;
  String? body;
  String? time;
  int? status;

  TaskModel();

  TaskModel.fromMap(map){
    id = map["id"];
    title= map["title"];
    body = map["body"];
    time = map["time"];
    status = map["status"];
  }

  Map<String,dynamic> toMap(){
    Map<String,dynamic>  taskMap = {};

    // taskMap["id"] = id;
    taskMap["title"] = title;
    taskMap["body"] = body;
    taskMap["time"] = time;
    taskMap["status"] = status;


    return taskMap;

  }
}