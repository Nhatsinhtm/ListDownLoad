import 'package:animationproject/Clock_view.dart';
import 'package:animationproject/screen/list_download_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Container(color: Colors.blue,
          alignment: Alignment.center,
          child: const ListDownload(),
        ),
      ),
    );
  }
}
