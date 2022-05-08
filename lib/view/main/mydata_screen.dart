
import 'package:flutter/material.dart';


class MyDataScreen extends StatefulWidget {
  const MyDataScreen({Key? key}) : super(key: key);
  @override
  _MyDataScreenState createState() => _MyDataScreenState();
}
class _MyDataScreenState extends State<MyDataScreen> {
  bool showProccessLoad = true;
  @override
  void initState() {
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async => false, 
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body:showProccessLoad ?const Center(child: CircularProgressIndicator(),): Container()
      )
    );
  }
}

