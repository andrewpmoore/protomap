import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gusty/main.dart';
import 'package:gusty/src/extensions/build_context_extensions.dart';

class SetWundergroundApiKeyView extends StatefulWidget {
  const SetWundergroundApiKeyView({Key? key}) : super(key: key);

  @override
  State<SetWundergroundApiKeyView> createState() => _SetWundergroundApiKeyViewState();
}

class _SetWundergroundApiKeyViewState extends State<SetWundergroundApiKeyView> {
  TextEditingController? editingController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
      editingController ??= TextEditingController(text: ref.read(settingsProvider).wundergroundApiKey);

      return Scaffold(
        // backgroundColor: context.colorScheme.background,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 20,),
              Text('If you have a personal weather station and upload the data to wunderground, then you can access it\'s data within the app, for this you\'ll need a api key which you can obtain from  https://www.wunderground.com/member/api-keys',
              style: context.style.labelMedium,),
              const SizedBox(
                height: 30,
              ),
              Text('Enter your wunderground key', style: context.style.bodyLarge,),
              const SizedBox(
                height: 10,
              ),
              TextField(
                  controller: editingController,
                  onChanged: (text) {
                    ref.read(settingsProvider).updateWundergroundApiKey(text);
                  }),
            ]),
          ),
        ),
      );
    });
  }
}
