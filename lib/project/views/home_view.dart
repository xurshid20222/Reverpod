import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_reverpod/project/page/detail/detail_page.dart';
import 'package:learn_reverpod/project/views/edit_dialog.dart';

import '../models/post_model.dart';
import '../page/detail/detail_controller.dart';
import '../page/home/home_riverpod_provider.dart';


class HomeView extends ConsumerWidget {
  const HomeView({Key? key, required this.post}) : super(key: key);
  final Post post;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(getDataFuture);
    final updateProvider = ref.watch(postDataUpgarade);
    return Card(
      child: ListTile(
        leading: IconButton(
          onPressed: () {
            updateProvider.initUpdate(post);
            provider.openDetailPage(post, context, DetailState.update);
          },
          icon: const Icon(Icons.edit),
        ),
        title: Text(post.title!, textAlign: TextAlign.center, style:  const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),),
        subtitle: Text(post.body!,textAlign: TextAlign.center, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.grey),),
        trailing: IconButton(
          onPressed: ()=> provider.deletePost(post.id!),
          icon:  const Icon(Icons.delete),
        ),
      ),
    );
  }
}
