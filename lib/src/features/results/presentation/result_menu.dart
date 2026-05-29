// enum Menu { preview, share, getLink, remove, download }
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:summit_rock/src/features/results/application/result_service.dart';
import 'package:summit_rock/src/features/word_decoder/domain/result.dart';

enum Menu { delete }

class ResultMenu extends ConsumerWidget {
  const ResultMenu({required this.result, super.key});

  final Result result;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton<Menu>(
      // popUpAnimationStyle: _animationStyle,
      icon: const Icon(Icons.more_vert),
      onSelected: (Menu item) {},
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
        // const PopupMenuItem<Menu>(
        //   value: Menu.preview,
        //   child: ListTile(
        //     leading: Icon(Icons.visibility_outlined),
        //     title: Text('Preview'),
        //   ),
        // ),
        // const PopupMenuItem<Menu>(
        //   value: Menu.share,
        //   child: ListTile(
        //     leading: Icon(Icons.share_outlined),
        //     title: Text('Share'),
        //   ),
        // ),
        // const PopupMenuItem<Menu>(
        //   value: Menu.getLink,
        //   child: ListTile(
        //     leading: Icon(Icons.link_outlined),
        //     title: Text('Get link'),
        //   ),
        // ),
        // const PopupMenuDivider(),
        PopupMenuItem<Menu>(
          value: Menu.delete,
          child: ListTile(
            leading: Icon(Icons.delete_outline),
            title: Text('Remove'),
            onTap: () async {
              // TODO delete this result
              await ref.read(resultServiceProvider).deleteResult(result.id);
            },
          ),
        ),
        // const PopupMenuItem<Menu>(
        //   value: Menu.download,
        //   child: ListTile(
        //     leading: Icon(Icons.download_outlined),
        //     title: Text('Download'),
        //   ),
        // ),
      ],
    );
  }
}
