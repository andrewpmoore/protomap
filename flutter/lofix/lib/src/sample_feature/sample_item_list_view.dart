import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lofi/main.dart';
import 'package:lofi/src/constants.dart';
import 'package:lofi/src/extensions/build_context_extensions.dart';
import 'package:lofi/src/scenes/scene_model.dart';
import 'package:rive/rive.dart';
import 'sample_item.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends ConsumerWidget {
  const SampleItemListView({
    super.key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
  });

  static const routeName = '/';

  final List<SampleItem> items;


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // final scenes = ref.watch(sceneListProvider);
    final scenes = ref.watch(sceneProvider);


    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Lo-fi audio'),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.settings),
      //       onPressed: () {
      //         // Navigate to the settings page. If the user leaves and returns
      //         // to the app after it has been killed while running in the
      //         // background, the navigation stack is restored.
      //         Navigator.restorablePushNamed(context, SettingsView.routeName);
      //       },
      //     ),
      //   ],
      // ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.


      body: Column(children: [
        const SafeArea(child: SizedBox()),
        SizedBox(
          height: 64,
          width: 64,
          child: scenes.selectedScene!=null ? Image.asset(
            '$imagePath/${scenes.selectedScene!.name}.png',
            fit: BoxFit.fitWidth,
          ) : Container(color: Colors.yellow, height: 100, width: 100,),
        ),
        if (scenes.selectedScene!=null) Column(children: [
          for (Feature feature in scenes.selectedScene!.features.where((element) => element.audio==true)) ElevatedButton(onPressed: (){
            scenes.playToggleEffect(feature.name);
          }, child: Text('feature ${feature.name}')),
        ],),
        const Expanded(
          child: SizedBox(child: RiveAnimation.network(
            'https://cdn.rive.app/animations/vehicles.riv',
          ),),
        ),
        ElevatedButton(
        child: const Text('Show Modal Bottom Sheet'),
        onPressed: () {
              showModalBottomSheet(
                  context: context,
                  // backgroundColor: Colors.green,
                  // barrierColor: Colors.orange.withOpacity(0.5),
                  builder: (BuildContext context) {
                    return SceneSelector();
                  });
            }),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     ElevatedButton(onPressed: () {}, child: const Text('Back')),
        //     const SizedBox(
        //       width: 20,
        //     ),
        //     ElevatedButton(onPressed: () async {
        //       final player = AudioPlayer();
        //       final duration = await player.setUrl('https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Music_for_Video/springtide/Sounds_strange_weird_but_unmistakably_romantic_Vol1/springtide_-_03_-_We_Are_Heading_to_the_East.mp3');
        //       player.play();
        //
        //     }, child: const Text('Start stuff')),
        //     const SizedBox(
        //       width: 20,
        //     ),
        //     ElevatedButton(onPressed: () {}, child: const Text('Forward')),
        //   ],
        // ),
        const SizedBox(height: 50,),

      ]),
      // ListView.builder(
      //   // Providing a restorationId allows the ListView to restore the
      //   // scroll position when a user leaves and returns to the app after it
      //   // has been killed while running in the background.
      //   restorationId: 'sampleItemListView',
      //   itemCount: items.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     final item = items[index];
      //
      //     return ListTile(
      //       title: Text('SampleItem ${item.id}'),
      //       leading: const CircleAvatar(
      //         // Display the Flutter Logo image asset.
      //         foregroundImage: AssetImage('assets/images/flutter_logo.png'),
      //       ),
      //       onTap: () {
      //         // Navigate to the details page. If the user leaves and returns to
      //         // the app after it has been killed while running in the
      //         // background, the navigation stack is restored.
      //         Navigator.restorablePushNamed(
      //           context,
      //           SampleItemDetailsView.routeName,
      //         );
      //       }
      //     );
      //   },
      // ),
    );
  }
}


class SceneSelector extends ConsumerWidget {
  const SceneSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scenes = ref.watch(sceneProvider);
    final String? selectedScene = scenes.selectedScene?.name;
    return ListView.builder(
        itemCount: scenes.sceneList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              HapticFeedback.selectionClick();
              scenes.setSelectedScene(scenes.sceneList[index]);
            },
            child: SizedBox(
              height: 150,
              child: Stack(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Image.asset(
                            '$imagePath/${scenes.sceneList[index].name}.png',
                            fit: BoxFit.fitWidth,
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${scenes.sceneList[index].description}', style: context.style.titleLarge),
                  ),
                  AnimatedContainer(duration: Duration(milliseconds: 300), color: selectedScene!=scenes.sceneList[index].name ? Colors.black.withOpacity(0.8): Colors.black.withOpacity(0),),
                ],
              ),
            ),
          );
        });
  }
}
