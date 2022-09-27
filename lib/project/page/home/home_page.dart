import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_reverpod/project/page/home/home_riverpod_provider.dart';
import '../../views/home_view.dart';
import '../detail/detail_controller.dart';



class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final postModel = ref.watch(getDataFuture);
  final detailProvider = ref.watch(postDataUpgarade);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod'),
        centerTitle: true,
      ),
      body: postModel.list.isEmpty ?
      const Center(
        child: CircularProgressIndicator(),
      ): ListView.builder(
        itemCount: postModel.list.length,
        itemBuilder: (context, index){
          var post = postModel.list[index];
          return HomeView(post: post);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          detailProvider.initCreate();
          postModel.createDetailPage(context, DetailState.create);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
