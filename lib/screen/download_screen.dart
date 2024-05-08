import 'dart:convert';

import 'package:animationproject/Model/DB_helper.dart';
import 'package:animationproject/Model/ListDownload.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DownloadScreen extends StatefulWidget {
  const DownloadScreen({super.key});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
 DB_helper dbHelper = DB_helper();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  List<DataList> data =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: dbHelper.getDataList(),
        builder: (context, snapshot) {
          data = snapshot.data!;
        if(data.isNotEmpty){
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(data[index].title.toString()),
              );
            },);
        }
        else{
          return CircularProgressIndicator();
        }
        },

      ),
    );
  }
}
