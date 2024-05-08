import 'dart:async';
import 'dart:convert';

import 'package:animationproject/Model/DB_helper.dart';
import 'package:animationproject/reponse/fetch_data.dart';
import 'package:animationproject/screen/download.dart';
import 'package:animationproject/screen/download_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/ListDownload.dart';

class ListDownload extends StatefulWidget {
  const ListDownload({super.key});

  @override
  State<ListDownload> createState() => _ListDownloadState();
}

class _ListDownloadState extends State<ListDownload> {

  bool? isCheck = false;
  late List<DataList> getDatas;

  @override
  void initState() {
    // TODO: implement initState
    _data = FetchData().getData();
    super.initState();
  }

  late Future _data;

  DB_helper dbHelper = DB_helper();
  List<DataList> dataDownLoad = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ElevatedButton(onPressed: () {
                Navigator.push(context, PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return Download();
                  },));
              }, child: Text('download')),
              FutureBuilder(
                future: _data,
                builder: (context, snapshot) {
                  final getDatas = snapshot.data;
                  if (snapshot.hasData) {
                    dataDownLoad=getDatas!;
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: dataDownLoad.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Text(dataDownLoad[index].id.toString()),
                          title: Text(dataDownLoad[index].title.toString()),
                          trailing: Checkbox(value: dataDownLoad[index].isCheck,
                            onChanged: (value) {
                              setState(() {
                                dataDownLoad[index].isCheck = value!;
                                if (getDatas[index].isCheck) {
                                  dbHelper.insert(DataList(
                                    isCheck: dataDownLoad[index].isCheck,
                                    id: dataDownLoad[index].id,
                                    title: dataDownLoad[index].title,
                                    url: dataDownLoad[index].url,
                                  )).then((value) {
                                    print('added');
                                  },).onError((error, stackTrace) {
                                    print(error);
                                    print('+++');
                                  },);
                                }
                                else {
                                  dbHelper.deleteData(dataDownLoad[index].id.toString()).then((
                                      value) {
                                    print('deleted');
                                  }).onError((error, stackTrace) {
                                    print(error);
                                    print('---');
                                  });
                                      }

                                  });
                            },),
                        );
                      },);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },),
            ],
          ),
        ),
      ),
    );
  }


}
