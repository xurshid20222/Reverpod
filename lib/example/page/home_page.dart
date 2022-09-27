import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_reverpod.dart';

/// Counter

// final counterStateProvider = StateProvider<int>((ref){
//   return 0;
// });
//
// class HomePage extends ConsumerWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final counter = ref.watch(counterStateProvider);
//     return Scaffold(
//       body: Center(
//         child: Text(
//           'Value: $counter',
//           style: Theme.of(context).textTheme.headline4,
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => ref.read(counterStateProvider.notifier).state++,
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }


///-----------------------------------------------------------------
 /// Clock & Timer
 //
 //  final clockProvider = StateNotifierProvider <Clock, DateTime>((ref){
 //    return Clock();
 //  });
 //
 //  class HomePage extends ConsumerWidget {
 //    const HomePage({Key? key}) : super(key: key);
 //
 //    @override
 //    Widget build(BuildContext context, WidgetRef ref) {
 //      final currentTime = ref.watch(clockProvider);
 //      //format
 //      // final timeFormatted = DateFormat.Hms().format(currentTime);
 //      return Scaffold(
 //        body: Center(
 //          child: Text(
 //            '$currentTime',
 //            textAlign: TextAlign.center,
 //            style: Theme.of(context).textTheme.headline4,
 //          ),
 //        ),
 //      );
 //    }
 //  }


 /// FutureProvider va StreamProvider
/// --------------------------------------------------
//   final futureProvider = FutureProvider<int>((ref){
//     return Future.value(36);
//   });
//
//   final streamProvider = StreamProvider<int>((ref){
//     return Stream.fromIterable([36, 72]);
//   });
//
//
//   class HomePage extends ConsumerWidget {
//     const HomePage({Key? key}) : super(key: key);
//
//     @override
//     Widget build(BuildContext context, WidgetRef ref) {
//       final streamAsyncValue = ref.watch(streamProvider);
//       return Scaffold(
//         body: Center(
//           child: streamAsyncValue.when(
//               data: (data) => Text('Value: $data'),
//               loading: () => const CircularProgressIndicator(),
//               error: (e, st) => Text('Error: $e'),
//           ),
//         ),
//       );
//     }
//   }
