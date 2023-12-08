import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zeal/main.dart';
import 'package:zeal/models/content.dart';
import 'package:zeal/ui/provider/content_provider.dart';
import 'package:flutter_html/flutter_html.dart';

class ContentPage extends ConsumerWidget  {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ContentProvider provider = ref.watch(contentProvider);


    return ListView.builder(
        itemCount: provider.contentList.length,
        itemBuilder: (BuildContext context, int index) {
          Content content = provider.contentList[index];
            return SingleContentCard(content);
        }
    );

    return Container(child: Text('Hello'),);
  }
}


class SingleContentCard extends StatelessWidget {
  final Content content;
  SingleContentCard(this.content);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 0,
          color: Colors.blue[100],
          child: Container(
        child: Column(children: [
          Text(content.title ?? ''),
          Html(
            data: content.body,
          )
        ],),
      )),
    );
  }
}

