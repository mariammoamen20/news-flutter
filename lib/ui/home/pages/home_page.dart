import 'package:flutter/material.dart';
import 'package:news/data/remote/api/api_manger.dart';
import 'package:news/data/remote/api/model/source_response.dart';
import 'package:news/ui/home/widgets/source_tab_widget.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'ui.home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.list_outlined,
          size: 35,
          color: Colors.white,
        ),
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Category',
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.search_outlined,
              color: Colors.white,
              size: 35,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          FutureBuilder<SourceResponse>(
              future: ApiManger.getNewsSource(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                var data = snapshot.data;
                if ('error' == data?.status) {
                  return Center(child: Text('${data?.message}'));
                }
                var source = data?.sources;
                return SourceTab(source!);/*Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Text((source!
                        [index].name) ?? '');
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: source?.length ?? 0),
                )*/
              }),
        ],
      ),
    );
  }
}
