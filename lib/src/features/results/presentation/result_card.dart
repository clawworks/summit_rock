import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:summit_rock/src/features/results/application/result_service.dart';
import 'package:summit_rock/src/features/settings/domain/summit_rock_year.dart';
import 'package:summit_rock/src/features/word_decoder/domain/result.dart';

import '../../../routing/app_router.dart';

class ResultCard extends ConsumerWidget {
  const ResultCard({required this.result, super.key});

  final Result result;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      borderOnForeground: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      // margin: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 10.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        radius: 10.0,
        onTap: () async {
          context.goNamed(AppRoute.result,
              pathParameters: {'resultId': result.id});
        },
        child: ClipPath(
          clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color:
                      ref.watch(colorSchemeProvider).primary, // TODO lighter?
                  width: 6.0,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ref.watch(resultTitleProvider(result)),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(width: 20.0),
                        Flexible(
                          child: Wrap(
                            children: [
                              for (String fav in result.favorites)
                                Text(
                                    '$fav${fav == result.favorites.last ? '' : ', '}'),
                            ],
                          ),
                        ),
                        // Text('${result.favorites}'),
                      ],
                    ),
                  ),
                  Row(
                    spacing: 24.0,
                    children: [
                      Text(result.rockNumber?.toString() ?? ''),
                      Text(result.clueNumber?.toString() ?? ''),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // child: InkWell(
      //   radius: 10.0,
      //   onTap: () async {
      //     context.goNamed(AppRoute.result,
      //         pathParameters: {'resultId': result.id});
      //   },
      //   child: Column(
      //     children: [
      //       Container(
      //         height: 4.0,
      //         color: ref.watch(colorSchemeProvider).primary,
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(16.0),
      //         child: IntrinsicHeight(
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Container(
      //                 width: 40.0,
      //                 color: ref.watch(colorSchemeProvider).primary,
      //               ),
      //               Text(
      //                 ref.watch(resultTitleProvider(result)),
      //                 style: Theme.of(context).textTheme.titleMedium,
      //               ),
      //               const SizedBox(width: 20.0),
      //               Flexible(
      //                 child: Wrap(
      //                   children: [
      //                     for (String fav in result.favorites)
      //                       Text(
      //                           '$fav${fav == result.favorites.last ? '' : ', '}'),
      //                   ],
      //                 ),
      //               ),
      //               // Text('${result.favorites}'),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
