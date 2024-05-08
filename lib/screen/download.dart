

import 'package:animationproject/Model/DB_helper.dart';
import 'package:animationproject/Model/Data_Provider.dart';
import 'package:animationproject/common/listdata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/ListDownload.dart';

class Download extends StatefulWidget {
  const Download({super.key});

  @override
  State<Download> createState() => _DownloadState();
}

class _DownloadState extends State<Download> {

  @override
  void initState() {
    super.initState();
  }
List<DataList> datass = [];
DB_helper db_helper = DB_helper();
late Future getData;
int a  =1;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<DataProvider>(context);
    return Scaffold(
      appBar: AppBar(leading: ElevatedButton(onPressed: () {
        setState(() {
          a++;
        });
      }, child: Text('+')),),
      body: SingleChildScrollView(
         scrollDirection: Axis.vertical,
        child: Column(
          children: [
            FutureBuilder(
              future:cart.getData(),
              builder: (context,AsyncSnapshot<List<DataList>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('abc'),
                      );
                    },
                  );
                }
              }
    ),
          ],
        ),
      ),
    );
  }
}
