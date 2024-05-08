
import 'dart:convert';

import 'package:animationproject/Model/ListDownload.dart';
import 'package:http/http.dart' as http;

class FetchData {
  var url = Uri.parse('https://api.jsonbin.io/v3/b/662884c4e41b4d34e4e93a95');

Future<List<DataList>> getData () async {
   List <DataList> getList = [];
  var hearDer = {
    'X-ACCESS-KEY': r'$2a$10$Fe3IHMJPY8zsCz19zbao8.yQOGj04XIwr5sM12HjTXjl3u/fYGtCK',
  };
  var response =  await http.get(url,headers: hearDer);
  var  jsonData = jsonDecode(response.body);
for (dynamic data in jsonData['record']){
  final item = DataList(id: data['id'], title: data['title'], url: data['url'] , isCheck: false);
  getList.add(item);
 }
  return getList;
}
}