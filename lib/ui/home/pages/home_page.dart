import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'ui.home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.list_outlined,size: 35,color: Colors.white,),
        toolbarHeight: MediaQuery.of(context).size.height*0.08,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text('Category',style: TextStyle(
          fontSize: 22,
          color: Colors.white
        ),
      ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight:Radius.circular(30), ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search_outlined,color: Colors.white,size: 35,),
          ),
        ],
      ),
    );
  }
}
