import 'package:animationproject/Model/DB_helper.dart';
import 'package:animationproject/Model/ListDownload.dart';
import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier{


DB_helper dbHelper = DB_helper();
  late Future<List<DataList>> _food;
  Future<List<DataList>> get food => _food;


  Future<List<DataList>> getData() async{
    _food=  dbHelper.getDataList();
    return _food;
  }

}