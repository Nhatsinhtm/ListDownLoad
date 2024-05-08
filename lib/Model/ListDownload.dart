// // To parse this JSON data, do
// //
// //     final dataList = dataListFromJson(jsonString);
//
// import 'dart:convert';
//
//
// class DataList {
//   String id;
//   String title;
//   String url;
//  bool isCheck;
//   DataList({
//     required this.id,
//     required this.title,
//     required this.url,
//      required this.isCheck,
//   });
//
//   factory DataList.fromJson(Map<String, dynamic> json) => DataList(
//     id: json["id"],
//     title: json["title"],
//     url: json["url"],
//     isCheck: false ,
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "title": title,
//     "url": url,
//   };
// }
class DataList {
  String? id;
  String? title;
  String? url;
  bool? isCheck;

  DataList({this.id, this.isCheck,this.title, this.url});

  DataList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
    isCheck = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['isCheck'] = false;
    return data;
  }
}
