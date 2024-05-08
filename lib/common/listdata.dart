import 'package:flutter/material.dart';

import '../Model/ListDownload.dart';

class ListData extends StatefulWidget {
   ListData({super.key, required this.datas});
List<DataList> datas;
  @override
  State<ListData> createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.datas.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(widget.datas[index].title.toString()),
        );
      },);
  }
}
