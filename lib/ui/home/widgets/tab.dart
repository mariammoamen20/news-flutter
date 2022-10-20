import 'package:flutter/material.dart';
import 'package:news/data/remote/api/model/source_response.dart';

class Tabs extends StatelessWidget {
  Sources sources ;
  bool selected;
  Tabs(this.sources,this.selected);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(top:16),
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: selected ? Colors.green : Colors.transparent,
        border: Border.all(color: Colors.green)
      ),
      child: Text(sources.name ?? " ",style: TextStyle(
        color: selected ? Colors.white : Colors.green
      ),),
    );
  }
}
