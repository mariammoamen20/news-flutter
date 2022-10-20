import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/ui/home/widgets/tab.dart';

import '../../../data/remote/api/model/source_response.dart';

class SourceTab extends StatefulWidget {
  List<Sources> sources;

  SourceTab(this.sources);

  @override
  State<SourceTab> createState() => _SourceTabState();
}

class _SourceTabState extends State<SourceTab> {
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources.length,
      child: Column(
        children: [
          TabBar(
            onTap: (index){
              isSelected = index;
              setState((){});
            },
            indicatorColor: Colors.transparent,
            isScrollable: true,
              tabs: widget.sources.map((source) {
                var selected = widget.sources.indexOf(source)==isSelected;
            return Tabs(source,selected);
          }).toList()),
        ],
      ),
    );
  }
}
